#include <Wire.h>
#include <SPI.h>
#include <Adafruit_Sensor.h>
#include "Adafruit_BME680.h"
#include <WiFi.h> 

#define BME_SCK 18
#define BME_MISO 19
#define BME_MOSI 23
#define BME_CS 4
#define SEALEVELPRESSURE_HPA (1013.25)

//Adafruit_BME680 bme; // I2C
//Adafruit_BME680 bme(BME_CS); // hardware SPI
Adafruit_BME680 bme(BME_CS, BME_MOSI, BME_MISO, BME_SCK);

const char* ssid = "PULV_DVIC";           
const char* password = "5UKAPIp!dvic"; 

void setup() {
    Serial.begin(115200);
    /*
    while (!Serial);
    if (!bme.begin()) {
        Serial.println("Could not find a valid BME680 sensor, check wiring!");
        while (1);
    }
    // Set up oversampling and filter initialization
    bme.setTemperatureOversampling(BME680_OS_8X);
    bme.setHumidityOversampling(BME680_OS_2X);
    bme.setPressureOversampling(BME680_OS_4X);
    bme.setIIRFilterSize(BME680_FILTER_SIZE_3);
    bme.setGasHeater(320, 150); // 320*C for 150 ms
    */
    WiFi.begin(ssid, password);
    
    Serial.print("Connecting");
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }
    Serial.println();
    
    Serial.print("Connected, IP address: ");
    Serial.println(WiFi.localIP());
}


void loop() {
  /*
    if (! bme.performReading()) {
        Serial.println("Failed to perform reading :(");
        return;
    }
    Serial.print("T(°C):" + String(bme.temperature) + ";");
    Serial.print("H(%):" + String(bme.humidity) + ";");
    Serial.print("P(hPa):" + String(bme.pressure / 100.0) + ";");
    Serial.println("G(KOhms):" + String(bme.gas_resistance / 1000.0) + ";");
    //Serial.println("A(m):" + String(bme.readAltitude(SEALEVELPRESSURE_HPA)) + ";");
    */
    delay(2000);
}
