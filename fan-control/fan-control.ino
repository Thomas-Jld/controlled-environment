
const int analogOutPin = 4; // Analog output pin that the LED is attached to

int outputValue = 512;        // value output to the PWM (analog out)

void setup() {
  // initialize serial communications at 9600 bps:
  Serial.begin(9600);
}

void loop() {
  analogWrite(analogOutPin, outputValue);
  delay(2000);
}
