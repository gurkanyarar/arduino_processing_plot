int data = 0 ;
void setup() {
  Serial.begin(9600);
  pinMode(A0,INPUT);
}

void loop() {
  data = analogRead(A0);
  Serial.println(data);
  
}
