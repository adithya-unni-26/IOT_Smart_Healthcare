#include "MAX30100.h"
#include "Wire.h"
MAX30100* pulseOxymeter;



int led_Pin = 13;                                      // initializing the led pin

int output_Pin = A0;                                // initializing the sensor output pin

//initializng other variables

double alpha = 0.75;

int period = 200;

double change = 0.0;




void setup ( )                           // Code written in it will only run once.

{

  pinMode (led_Pin, OUTPUT);                   // declaring led pin as output
  Wire.begin();
 // Serial.begin (115200);
 Serial.begin(9600);     
  pinMode(10, INPUT); // Setup for leads off detection LO +
  pinMode(11, INPUT); // Setup for leads off detection LO -// setting baud rate at 115200

  Serial.println("Pulse oxymeter test!");
 
  pulseOxymeter = new MAX30100();
  pinMode(2, OUTPUT);
 

  

}




void loop ()

{    // initializing other variables
    if((digitalRead(10) == 1)||(digitalRead(11) == 1)){
      Serial.println('!');
         }
     else{
// send the value of analog input 0:
       Serial.println(analogRead(A1));
          }
//Wait for a bit to keep serial data from saturating
         delay(1);

    static double oldValue = 0;

    static double oldChange = 0;

    int rawValue = analogRead (output_Pin);                                         // Reading the sensors values

    double value = alpha * oldValue + (1 - alpha) * rawValue;         // calculating values using the formula

    double value1=0;

     pulseoxymeter_t result = pulseOxymeter->update();
  
  if( result.pulseDetected == true )
  {
    Serial.println("BEAT");
    
    Serial.print( "BPM: " );
    Serial.print( result.heartBPM );
  }

    Serial.print (rawValue);              // printing the sensor output value on the screen

    Serial.print (",");       

    if(value>200){
      value1=1;

//            printing the heart beat value on the screen
    }
    else
    {
      value1=0;
    }
    oldValue = value;
        Serial.println (value1);  

    delay (period);

} 
