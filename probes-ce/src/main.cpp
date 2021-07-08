
/*-----------Sensors-----------*/
#include <Wire.h>
#include <SPI.h>
#include <Adafruit_Sensor.h>
#include "Adafruit_BME680.h"


/*------------Server------------*/
#include <WiFi.h> 
#include <HTTPClient.h>
#include <secret.h> //Credentials

#define BME_SCK 18
#define BME_MISO 19
#define BME_MOSI 23
#define BME_CS 4
#define SEALEVELPRESSURE_HPA (1013.25)

Adafruit_BME680 bme(BME_CS, BME_MOSI, BME_MISO, BME_SCK);

const char* serverName = "http://172.21.72.105:27170/controlledenvironment/submit/";

unsigned long timerDelay = 10000;
unsigned long lastTime = 0;

String id = "0";

/* More information in guides like this : https://randomnerdtutorials.com/esp32-http-get-post-arduino/ */
void postSensorData(String data){
  
  if(WiFi.status()== WL_CONNECTED){   

    /* Instantiate our request object (it will contain headers, body, and servers reponses) */
    HTTPClient http;
    WiFiClient client;
    
    /* Set request target */
    http.begin(client, serverName);  

    /* Set http headers */
    http.addHeader("Content-Type", "application/json");
    http.addHeader("User-Agent","Espregasssif");
    http.addHeader("Accept", "*/*");
    http.addHeader("Accept-Encoding", "gzip, deflate, br");
    http.addHeader("Connection","keep-alive");     
    
    Serial.println(data);
    /* Send the actual POST request to the API */
    int httpResponseCode = http.POST(data);   

    /* Check for errors */
    if(httpResponseCode>0){
      
        /* Get and print the response from the server */
        String response = http.getString();                       
        Serial.println(response);
      
    }else{
        String error = "";
        switch (httpResponseCode) {
            case -1: error = "ERROR_CONNECTION_REFUSED"; break;
            case -2: error = "ERROR_SEND_HEADER_FAILED"; break;
            case -3: error = "ERROR_SEND_PAYLOAD_FAILED"; break;
            case -4: error = "ERROR_NOT_CONNECTED"; break;
            case -5: error = "ERROR_CONNECTION_LOST"; break;
            case -6: error = "ERROR_NO_STREAM"; break;
            case -7: error = "ERROR_NO_HTTP_SERVER"; break;
            case -8: error = "ERROR_TOO_LITTL_RAM"; break;
            case -9: error = "ERROR_ENCODING"; break;
            case -10: error = "ERROR_STREAM_WRITE"; break;
            case -11: error = "ERROR_READ_TIMEOUT"; break;
            default: error = "UNKOWN_ERROR"; break;
        }
        Serial.println("Error on sending POST: " + error);
        Serial.println("If the error persists, 1) check that server's running 2) your network setting in declarations file 3) try to press 'RESET' on the board.");
    }
        
        /* Free resources */
        http.end();  
    }else{
        // Unlikely case where connection got spontanenously lost
        Serial.println("Error in WiFi connection. Attempt to reconnect...");
        WiFi.begin(SSID, PASSWORD);   
    }
}


void setup() {
    Serial.begin(115200);
    if (!bme.begin()) {
        Serial.println("Could not find a valid BME680 sensor, check wiring!");
        while (1);
    }
    // Set up oversampling and filter initializationMyEndpointURL
    bme.setTemperatureOversampling(BME680_OS_8X);
    bme.setHumidityOversampling(BME680_OS_2X);
    bme.setPressureOversampling(BME680_OS_4X);
    bme.setIIRFilterSize(BME680_FILTER_SIZE_3);
    bme.setGasHeater(320, 150); // 320*C for 150 ms
    
    WiFi.begin(SSID, PASSWORD); 
    //Add a secret.h in the include folder and define your credentials
    
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
    if ((millis() - lastTime) > timerDelay) {
        if (! bme.performReading()) {
            Serial.println("Failed to perform reading :(");
            return;
        }

        String data = "{\"Id\":\"" + id
            + "\",\"Temperature\":\"" + String(bme.temperature) 
            + "\",\"Humidity\":\"" + String(bme.humidity) 
            + "\",\"Pressure\":\"" + String(bme.pressure / 100.0)
            + "\",\"Gas\":\"" + String(bme.gas_resistance / 1000.0)
            + "\"}";

        Serial.println(data);
        postSensorData(data);
        lastTime = millis();
    }
    delay(100);
}
