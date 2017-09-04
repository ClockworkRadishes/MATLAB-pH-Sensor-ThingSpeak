  //  We'll use analog input 0 to measure the temperature sensor's signal pin.
const int temperaturePin = A0;


void setup() {

    //  Initialize serial port & set baud rate to 9600 bits per second (bps)
  Serial.begin(9600);

}


void loop() {

    //  Declare 2 float vars
  float voltage, pH;

    //  Measure voltage at analog pin
  voltage = getVoltage(temperaturePin);

    //  Convert voltage to pH level
  pH = ((1.75 - voltage) / .25) + 7;

    //  Print pH to serial monitor (9600 baud)
  Serial.println(pH);

    //  Repeat 1x per second
  delay(1000);

}


float getVoltage(int pin) {

    //  Function to read and return floating-point value (true voltage) on analog pin
  return (analogRead(pin) * .00488758553274682307);    // 5 / 1023

    //  This function converts the 0 to 1023 value that analogRead()
    //  returns into a 0.0 to 5.0 value that is the true voltage
    //  being read at that pin.

}


//  Other things to try with this code:
//    Turn on an LED if the temperature is above or below a value.
//    Read that threshold value from a potentiometer - now you've
//    created a thermostat!
