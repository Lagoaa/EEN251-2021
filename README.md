# EEN251-2021

![image](https://user-images.githubusercontent.com/9613194/121415261-ea898080-c93d-11eb-9472-b645d67efc66.png)


![image](https://user-images.githubusercontent.com/9613194/121416231-f164c300-c93e-11eb-9114-e36a730db061.png)



![image](https://user-images.githubusercontent.com/9613194/121416245-f7f33a80-c93e-11eb-83bf-263e49d2845d.png)


Código de contagem (PRE):

  ON Start:
  
    X = 0
    
  ON Message:
  
    X = X+1;
    msg.payload = X/2;
    return msg;

  Código do valor dos corredores (Corredor): 


    msg.payload = {"corredor-[N°]":{"value":msg.payload}};
    return msg;
  
  
  ![image](https://user-images.githubusercontent.com/9613194/121415285-f4ab7f00-c93d-11eb-9d2c-40b47d474ccd.png)
