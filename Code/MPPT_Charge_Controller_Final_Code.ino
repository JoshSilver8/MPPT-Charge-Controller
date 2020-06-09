#include <LiquidCrystal.h>
#include <Wire.h>

//------------------------------------------------------------------------------------------------------
// Joshua Silver
// MPPT Solar Battery Charger Controller
// Power Electronics ENGR 460
// Rob Frohne
//------------------------------------------------------------------------------------------------------

#include "TimerOne.h"          // using Timer1 library from http://www.arduino.cc/playground/Code/Timer1
#include <wire.h>


//------------------------------------------------------------------------------------------------------
// definitions

#define SOL_AMPS_CHAN 1               // Defining the adc channel to read solar amps
#define SOL_VOLTS_CHAN 0              //                                 -solar volts
#define BAT_VOLTS_CHAN 2              //                                 -battery volts

#define AVG_NUM 8                     // number of iterations of the adc routine to average the adc readings
#define SOL_AMPS_SCALE 7              // the scaling value for raw adc reading to get solar amps scaled by 100
#define SOL_VOLTS_SCALE 27            //                                             -solar volts scaled by 100
#define BAT_VOLTS_SCALE 27            //                                             -battery volts scaled by 100

#define PWM_PIN 9                     // the output pin for the pwm (only pin 9 avaliable for timer 1 at 50kHz)
#define PWM_ENABLE_PIN 8              // pin used to control shutoff function of the IR2104 MOSFET driver (hight the mosfet driver is on)
#define PWM_FULL 1023                 // the actual value used by the Timer1 routines for 100% pwm duty cycle
#define PWM_MAX 100                   
#define PWM_MIN 60                    // the value for pwm duty cyle below this value the current running in the system is = 0)
#define PWM_START 90                 
#define PWM_INC 1                     //the pwm increment

#define TRUE 1
#define FALSE 0
#define ON TRUE
#define OFF FALSE

#define TURN_ON_MOSFETS digitalWrite(PWM_ENABLE_PIN, HIGH)      // enable MOSFET driver
#define TURN_OFF_MOSFETS digitalWrite(PWM_ENABLE_PIN, LOW)      // disable MOSFET driver

#define ONE_SECOND 50000             //count for number of interrupt in 1 second on interrupt period of 20us

#define LOW_SOL_WATTS 500            //values here are scaled by 100 i.e 500 = 5.00 watts
#define MIN_SOL_WATTS 100            
#define MIN_BAT_VOLTS 800                   
#define MAX_BAT_VOLTS 1410           
#define HIGH_BAT_VOLTS 1300          
#define OFF_NUM 9                  // number of iterations of off charger state
  
//------------------------------------------------------------------------------------------------------
//Defining led pins for indication
#define LED_RED_OFF 12 //Off
#define LED_GREEN 10   //On
#define LED_YELLOW 11  //Buck

  
//------------------------------------------------------------------------------------------------------
// global variables

int ledPin = 13;                      
int ledPin_jc2 = 5;                  
int ledPin_jc3 = 6;                   


int count = 0;
int pwm = 0;                          //pwm duty cycle 0-100%
int sol_amps;                         // solar amps scaled by 100
int sol_volts;                        // solar volts scaled by 100
int bat_volts;                        // battery volts scaled by 100
int sol_watts;                        // solar watts scaled by 100
int old_sol_watts = 0;                // solar watts from previous time through ppt routine scaled by 100
unsigned int seconds = 0;             // seconds from timer routine
unsigned int prev_seconds = 0;        // seconds value from previous pass
unsigned int interrupt_counter = 0;   // counter for 20us interrrupt
boolean led_on = TRUE;
int led_counter = 0;
int delta = PWM_INC;                  // variable used to modify pwm duty cycle for the ppt algorithm
                                      // enumerated variable that holds state for charger state machine
enum charger_mode {off, on, buck, bat_float} charger_state;    
//------------------------------------------------------------------------------------------------------
// This routine is automatically called at powerup/reset
//------------------------------------------------------------------------------------------------------
void setup()                            // run once, when the sketch starts
{
  pinMode(LED_RED_OFF, OUTPUT);
  pinMode(LED_GREEN, OUTPUT);
  pinMode(LED_YELLOW, OUTPUT);
  
  pinMode(ledPin, OUTPUT);             // sets the digital pin as output
  pinMode(ledPin_jc2, OUTPUT);         // sets the digital pin as output
  pinMode(PWM_ENABLE_PIN, OUTPUT);     // sets the digital pin as output
  Timer1.initialize(20);               // initialize timer1, and set a 20uS period
  Timer1.pwm(PWM_PIN, 0);              // setup pwm on pin 9, 0% duty cycle
  TURN_ON_MOSFETS;                     //turn on MOSFET driver chip
  Timer1.attachInterrupt(callback);    // attaches callback() as a timer overflow interrupt
  Serial.begin(9600);                  // open the serial port at 38400 bps:
  pwm = PWM_START;                     //starting value for pwm  
  charger_state = on;                  // start with charger state as on
}
//------------------------------------------------------------------------------------------------------
// This is interrupt service routine for Timer1 that occurs every 20uS.
//
//------------------------------------------------------------------------------------------------------
void callback()
{
  if (interrupt_counter++ > ONE_SECOND) {        //increment interrupt_counter until one second has passed
    interrupt_counter = 0;  
    seconds++;                                   //then increment seconds counter
  }
}
//------------------------------------------------------------------------------------------------------
// This routine reads and averages the analog inputs for this system, solar volts, solar amps and 
// battery volts. 
//------------------------------------------------------------------------------------------------------
int read_adc(int channel){
  
  int sum = 0;
  int temp;
  int i;
  
  for (i=0; i<AVG_NUM; i++) {            // loop through reading raw adc values AVG_NUM number of times  
    temp = analogRead(channel);          
    sum += temp;                        
    delayMicroseconds(50);                
  }
  return(sum / AVG_NUM);                // divide sum by AVG_NUM to get average and return it
}
//-----------------------------------------------------------------------------------
// This function prints int that was scaled by 100 with 2 decimal places
//-----------------------------------------------------------------------------------
void print_int100_dec2(int temp) {

  Serial.print(temp/100,DEC);         // divide by 100 and print interger value
  Serial.print(".");
  if ((temp%100) < 10) {              // if fractional value has only one digit
    Serial.print("0");                
    Serial.print(temp%100,DEC);       // get remainder and print fraction
  }else
    Serial.print(temp%100,DEC);       // get remainder and print fraction
  
}
//------------------------------------------------------------------------------------------------------
// This routine uses the Timer1.pwm function to set the pwm duty cycle.
//------------------------------------------------------------------------------------------------------
void set_pwm_duty(void) {

  if (pwm > PWM_MAX) 			  
    pwm = PWM_MAX;		
  else if (pwm < PWM_MIN)		
    pwm = PWM_MIN;
 
  if (pwm < PWM_MAX) 
    Timer1.pwm(PWM_PIN,(PWM_FULL * (long)pwm / 100), 20); // use Timer1 routine to set pwm duty cycle at 20uS period
  else if (pwm == PWM_MAX) 			                     // if pwm set to 100% it will be on full but we have 
    Timer1.pwm(PWM_PIN,(PWM_FULL - 1), 1000);          // keep switching so set duty cycle at 99.9% and slow down to 1000uS period            
  												
}													
//------------------------------------------------------------------------------------------------------
// This routine prints all the data out to the serial port.
//------------------------------------------------------------------------------------------------------
void print_data(void) {
  
  Serial.print(seconds,DEC);
  Serial.print("  ");

  Serial.print("Charging State - ");
  if (charger_state == on) Serial.print("on   ");
  else if (charger_state == off) Serial.print("off  ");
  else if (charger_state == buck) Serial.print("buck ");
  else if (charger_state == bat_float) Serial.print("float");
  Serial.print("  ");
  lcd.setCursor(0, 0); // Set the cursor on the first column and first row.
  lcd.print("Hello World!"); // Print the string "Hello World!"
  Serial.print("PWM = ");
  Serial.print(pwm,DEC);
  Serial.print("  ");

  Serial.print("Current (panel) = ");
  print_int100_dec2(sol_amps);
  Serial.print("  ");

  Serial.print("Voltage (panel) = ");
  //Serial.print(sol_volts,DEC);
  print_int100_dec2(sol_volts);
  Serial.print("  ");

  Serial.print("Power (panel) = ");
  //Serial.print(sol_volts,DEC);
  print_int100_dec2(sol_watts);
  Serial.print("  ");

  Serial.print("Battery Voltage = ");
  //Serial.print(bat_volts,DEC);
  print_int100_dec2(bat_volts);
  Serial.print("  ");

  Serial.print("\n\r");
}
//------------------------------------------------------------------------------------------------------
// This routine reads all the analog input values for the system. Then it multiplies them by the scale
// factor to get actual value in volts or amps. 
//------------------------------------------------------------------------------------------------------
void read_data(void) {
  
  sol_amps  =  ((read_adc(SOL_AMPS_CHAN)  * SOL_AMPS_SCALE) + 5) / 10;    
  sol_volts = ((read_adc(SOL_VOLTS_CHAN) * SOL_VOLTS_SCALE) + 5) / 10;   
  bat_volts = ((read_adc(BAT_VOLTS_CHAN) * BAT_VOLTS_SCALE) + 5) / 10;    
  sol_watts = (int)((((long)sol_amps * (long)sol_volts) + 50) / 100);                     
}

//------------------------------------------------------------------------------------------------------
// This routine is the charger state machine. It has four states on, off, buck and float.
// It's called once each time through the main loop to see what state the charger should be in.
// The battery charger can be in one of the following four states:
// 
//  On State - this is charger state for MIN_SOL_WATTS < solar watts < LOW_SOL_WATTS. In this state the solar 
//      watts input is too low for the buck charging state but not low enough to go into the off state. 
//      In this state we just set the pwm = 99.9% to get the most of low amount of power available.

//  buck State - this is charger state for solar watts > MIN_SOL_WATTS. This is where we do the buck of the battery
//      charging and where we run the Peak Power Tracking alogorithm. In this state we try and run the maximum amount
//      of current that the solar panels are generating into the battery.

//  Float State - As the battery charges it's voltage rises. When it gets to the MAX_BAT_VOLTS we are done with the 
//      buck battery charging and enter the battery float state. In this state we try and keep the battery voltage
//      at MAX_BAT_VOLTS by adjusting the pwm value. If we get to pwm = 100% it means we can't keep the battery 
//      voltage at MAX_BAT_VOLTS which probably means the battery is being drawn down by some load so we need to back
//      into the buck charging mode.

//  Off State - This is state that the charger enters when solar watts < MIN_SOL_WATTS. The charger goes into this
//      state when there is no more power being generated by the solar panels. The MOSFETs are turned
//      off in this state so that power from the battery doesn't leak back into the solar panel. 
//------------------------------------------------------------------------------------------------------
void run_charger(void) {
  
  static int off_count = OFF_NUM;

  switch (charger_state) {
    case on:                                        
      if (sol_watts < MIN_SOL_WATTS) {                  //if watts input from the solar panel is less than
        charger_state = off;                            //the minimum solar watts then 
        off_count = OFF_NUM;                            //go to the charger off state
        TURN_OFF_MOSFETS; 
      }
      else if (bat_volts > MAX_BAT_VOLTS)                 //else if the battery voltage has gotten above the float
        charger_state = bat_float;                         //battery float voltage go to the charger battery float state
      else if (sol_watts < LOW_SOL_WATTS) {               //else if the solar input watts is less than low solar watts
        pwm = PWM_MAX;                                    //it means there is not much power being generated by the solar panel
        set_pwm_duty();			                               //so we just set the pwm = 100% so we can get as much of this power as possible
      }                                                    //and stay in the charger on state
      else {                                          
        pwm = ((bat_volts * 10) / (sol_volts / 10)) + 5;   //else if we are making more power than low solar watts figure out what the pwm
        charger_state = buck;                              //value should be and change the charger to buck state 
      }
      break;
    case buck:
      if (sol_watts < MIN_SOL_WATTS) {               //if watts input from the solar panel is less than
        charger_state = off;                        //the minimum solar watts then it is getting dark so
        off_count = OFF_NUM;                        //go to the charger off state
        TURN_OFF_MOSFETS; 
      }
      else if (bat_volts > MAX_BAT_VOLTS)         //else if the battery voltage has gotten above the float
        charger_state = bat_float;                //battery float voltage go to the charger battery float state
      else if (sol_watts < LOW_SOL_WATTS) {      //else if the solar input watts is less than low solar watts
        charger_state = on;                      //it means there is not much power being generated by the solar panel
        TURN_ON_MOSFETS;                         //so go to charger on state
      }
      else {                                     // this is where we do the Peak Power Tracking using Maximum Power Point algorithm
        if (old_sol_watts >= sol_watts) {        //  if previous watts are greater change the value of
          delta = -delta;			                    // delta to make pwm increase or decrease to maximize watts
        }
        pwm += delta;                           // add delta to change PWM duty cycle for PPT algorythm (compound addition)
        old_sol_watts = sol_watts;              // load old_watts with current watts value for next time
        set_pwm_duty();			                  	// set pwm duty cycle to pwm value
      }
      break;
    case bat_float:
      if (sol_watts < MIN_SOL_WATTS) {          //if watts input from the solar panel is less than
        charger_state = off;                    //the minimum solar watts then it is getting dark so
        off_count = OFF_NUM;                    //go to the charger off state
        set_pwm_duty();					
        TURN_OFF_MOSFETS; 
      }
      else if (bat_volts > MAX_BAT_VOLTS) {    //since we're in the battery float state if the battery voltage
        pwm -= 1;                               //is above the float voltage back off the pwm to lower it   
        set_pwm_duty();					
      }
      else if (bat_volts < MAX_BAT_VOLTS) {    //else if the battery voltage is less than the float voltage
        pwm += 1;                              //increment the pwm to get it back up to the float voltage
        set_pwm_duty();					
        if (pwm >= 100)                        //if pwm gets up to 100 it means we can't keep the battery at
          charger_state = buck;                //float voltage so jump to charger buck state to charge the battery
        
      }
      break;
    case off:                                  //when we jump into the charger off state, off_count is set with OFF_NUM
      if (off_count > 0)                       //this means that we run through the off state OFF_NUM of times with out doing
        off_count--;                           //anything, this is to allow the battery voltage to settle down to see if the  
                                               //battery has been disconnected
      else if ((bat_volts > HIGH_BAT_VOLTS) && (bat_volts < MAX_BAT_VOLTS) && (sol_volts > bat_volts)) {
        charger_state = bat_float;             //if battery voltage is still high and solar volts are high
        set_pwm_duty();		                     //change charger state to battery float			
        TURN_ON_MOSFETS; 
      }    
      else if ((bat_volts > MIN_BAT_VOLTS) && (bat_volts < MAX_BAT_VOLTS) && (sol_volts > bat_volts)) {
        pwm = PWM_START;                        //if battery volts aren't quite so high but we have solar volts
        set_pwm_duty();		                    	//greater than battery volts showing it is day light then	
        charger_state = on;                     //change charger state to on so we start charging
        TURN_ON_MOSFETS; 
      }                                         
      break;
    default:
      TURN_OFF_MOSFETS;                         //else stay in the off state
      break;
  }
}

//------------------------------------------------------------------------------------------------------
//This function displays the currnet state with the help ot the 3 LEDs
//------------------------------------------------------------------------------------------------------
void led_output(void)
{
  if(charger_state == on){
      leds_off_all();
      digitalWrite(LED_GREEN, HIGH);
  } else if(charger_state == off){
      leds_off_all();
      digitalWrite(LED_RED_OFF, HIGH);  
  } else if(charger_state == buck){
      leds_off_all;
      digitalWrite(LED_YELLOW, HIGH);
  } else if(charger_state == bat_float){
      leds_off_all();
      digitalWrite(LED_GREEN, HIGH);
      digitalWrite(LED_RED_OFF, HIGH);
      digitalWrite(LED_YELLOW, HIGH);
  }
}

//------------------------------------------------------------------------------------------------------
// This function is used to turn all the leds off
//------------------------------------------------------------------------------------------------------
void leds_off_all(void)
{
  digitalWrite(LED_GREEN, LOW);
  digitalWrite(LED_RED_OFF, LOW);
  digitalWrite(LED_YELLOW, LOW);
}

//------------------------------------------------------------------------------------------------------
// Main loop.
//------------------------------------------------------------------------------------------------------
void loop()                         
{
  read_data();                  
  run_charger();                      
  print_data();                       
  led_output();
  
}
