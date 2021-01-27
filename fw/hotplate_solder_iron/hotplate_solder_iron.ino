#include "max6675.h"
#include "SSD1306.h"

SSD1306  display(0x3c, D2, D1);   //display(I2C address, SDA, SCL)

// define max6675 pins
const int thermoDO = D6;
const int thermoCS = D7;
const int thermoCLK = D5;
MAX6675 thermocouple(thermoCLK, thermoCS, thermoDO);

// define pins
const int button = 2;
const int solidstate = 15;
const int poti = A0;

// pre-defined temp values
const int temp_preheat = 150; //150
const int temp_reflow = 250; //250
const int offset = -20;
// pre-defined seconds to hold the set temperature
const int preheat_hold = 60000; //in ms (5s)
const int reflow_hold = 30000; //in ms (20s)

int temp_now = 0;
int temp_poti = 0;
int perc = 0;
int time_start=0;
String str_poti="";
String str_max="";
String str_perc="";

// debounce button
int buttonState;
int lastButtonState = LOW;
unsigned long lastDebounceTime = 0;
unsigned long debounceDelay = 50; //in ms

// state machine
enum State {OFF, PREHEAT, REFLOW, HOLD_PREHEAT, HOLD_REFLOW};
int state = OFF;

void setup() {
  Serial.begin(9600);
  // Start-Stop button init
  pinMode(button, INPUT);
  // SSR init
  pinMode(solidstate, OUTPUT);
  digitalWrite(solidstate, LOW);
  // display init
  display.init();
  display.flipScreenVertically();
  display.setFont(ArialMT_Plain_16);
  display.drawString(40, 0, "Starting");
  display.setFont(ArialMT_Plain_24);
  display.drawString(20, 24, "Hotplate");
  // write the buffer to the display
  display.display();
  // wait for MAX chip to stabilize - 500ms is enough, 5s justfor the show
  delay(5000);
}

static void draw_menu(int temp, int poti, int state, int perc) {
  str_poti = String(poti);
  str_max = String(temp);
  str_perc = String(perc);
  display.clear();
  switch (state) {
      case OFF: 
        display.setFont(ArialMT_Plain_16);
        display.drawString(0, 0, "Reflow temp:");
        display.drawString(100, 0, str_poti);
        display.drawString(0, 16, "Temp now:");
        display.drawString(100, 16, str_max);
        display.drawString(0, 32, "State: OFF");
        break;   
        
      case PREHEAT: 
        display.setFont(ArialMT_Plain_16);
        display.drawString(0, 0, "Reflow temp:");
        display.drawString(100, 0, str_poti);
        display.drawString(0, 16, "Temp now:");
        display.drawString(100, 16, str_max);
        display.drawString(0, 32, "State: PREHEAT");
        display.drawString(0, 48, str_perc);
        display.drawString(25, 48, "% Done");
        break;
        
      case REFLOW: 
        display.setFont(ArialMT_Plain_16);
        display.drawString(0, 0, "Reflow temp:");
        display.drawString(100, 0, str_poti);
        display.drawString(0, 16, "Temp now:");
        display.drawString(100, 16, str_max);
        display.drawString(0, 32, "State: REFLOW");
        display.drawString(0, 48, str_perc);
        display.drawString(25, 48, "% Done");
        break;
        
      case HOLD_PREHEAT: 
        display.setFont(ArialMT_Plain_16);
        display.drawString(0, 0, "Reflow temp:");
        display.drawString(100, 0, str_poti);
        display.drawString(0, 16, "Temp now:");
        display.drawString(100, 16, str_max);
        display.drawString(0, 32, "Preheat HOLD");
        display.drawString(0, 48, str_perc);
        display.drawString(25, 48, "% Done");
        break;
        
      case HOLD_REFLOW: 
        display.setFont(ArialMT_Plain_16);
        display.drawString(0, 0, "Reflow temp:");
        display.drawString(100, 0, str_poti);
        display.drawString(0, 16, "Temp now:");
        display.drawString(100, 16, str_max);
        display.drawString(0, 32, "Reflow HOLD");
        display.drawString(0, 48, str_perc);
        display.drawString(25, 48, "% Done");
        break;
        
      default:
        display.setFont(ArialMT_Plain_16);
        display.drawString(0, 0, "Reflow temp:");
        display.drawString(100, 0, str_poti);
        display.drawString(0, 16, "Temp now:");
        display.drawString(100, 16, str_max);
        display.drawString(0, 32, "State: UNKNOWN");
        break;
  }
  display.display();
}

static void draw_reflow_menu(int temp, int poti) {
  str_poti = String(poti);
  str_max = String(temp);

  display.clear();
  display.setFont(ArialMT_Plain_16);
  display.drawString(0, 0, "Reflow temp:");
  display.drawString(100, 0, str_poti);
  display.drawString(0, 16, "Temp now:");
  display.drawString(100, 16, str_max);
  display.display();
}

static void hold_state(int hold_temp, int time_start, int hold_time, int hold_state){
  Serial.println("holding temp");
  while(millis() - time_start < hold_time){
    check_off();
    temp_now = thermocouple.readCelsius();
    regulate_temp_hold(temp_now, hold_temp);
    perc = int((float((millis() - time_start)) / float(hold_time)) * 100.00);
    draw_menu(temp_now, temp_poti, hold_state, perc);
    delay(200);
  }
  Serial.println("DONE holding temp");
}

static void check_off(void){
  if(state != OFF && read_button() == 0){
    digitalWrite(solidstate, LOW);
    state = OFF;
  }
}

void loop() {
  check_off();

  switch (state) {
      case OFF:
        temp_now = thermocouple.readCelsius();
        temp_poti = map(analogRead(poti), 1023, 0, temp_preheat, temp_reflow);
        Serial.println(temp_now);
        Serial.println(temp_poti);
        draw_menu(temp_now, temp_poti, state, -1);
        if (read_button() == 0) {
          state = PREHEAT;
        }
        break;
        
      case PREHEAT:
        temp_now = thermocouple.readCelsius();
        Serial.println(temp_now);
        regulate_temp(temp_now, temp_preheat);
        perc = int((float(temp_now) / float(temp_preheat)) * 100.00);
        if(perc >= 100){
          perc = 100;
          int time_preheat = millis();
          hold_state(temp_preheat, time_preheat, preheat_hold, HOLD_PREHEAT);
          state = REFLOW;
          break;
        }
        draw_menu(temp_now, temp_poti, state, perc);
        break;
        
      case REFLOW: 
        temp_now = thermocouple.readCelsius();
        Serial.println(temp_now);
        regulate_temp(temp_now, temp_poti);
        perc = int((float(temp_now) / float(temp_poti)) * 100.00);
        if(perc >= 100){
          perc = 100;
          int time_reflow = millis();
          hold_state(temp_poti, time_reflow, reflow_hold, HOLD_REFLOW);
          digitalWrite(solidstate, LOW);
          state = OFF;
          break;
        }
        draw_menu(temp_now, temp_poti, state, perc);
        break;
        
      default:
        draw_menu(temp_now, temp_poti, -1, -1);
        break;
  }
 
  
  delay(200); //not slower, max6675 needs time to finish reading
}

// debounce button
static int read_button(void){
  int reading = digitalRead(button);
  if (reading != lastButtonState) {
    lastDebounceTime = millis();
  }
  if ((millis() - lastDebounceTime) > debounceDelay) {
    if (reading != buttonState) {
      buttonState = reading;
    }
  }
  lastButtonState = reading;
  return lastButtonState;
}

// regulate temperature
static void regulate_temp(int temp, int should) {
  if (should <= temp - offset) {
    digitalWrite(solidstate, LOW);
  }
  else if (should > temp + offset) {
    digitalWrite(solidstate, HIGH);
  }
}

static void regulate_temp_hold(int temp, int should){
    if (should <= temp) {
    digitalWrite(solidstate, LOW);
  }
  else if (should > temp) {
    digitalWrite(solidstate, HIGH);
  }
}
