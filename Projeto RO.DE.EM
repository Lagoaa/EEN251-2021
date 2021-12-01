####################################################################################
# Projeto de microcontroladores e sistemas embarcados - Eng. Eletrônica - Diurno - 4° ano - 2° semestre
# Alunos: Antonio(17.04186-4), Eduardo(17.01189-2), João(18.00979-4), Leticia(18.02509-9)
# Tema: Robo detector de emoções
#
####################################################################################

## Importando bibliotecas ##
from ulab import numpy as np
#from ulab import ndarray as na
import math
#from ulab import scipy
import machine
import utime
from machine import Pin, SPI
from ssd1306 import SSD1306_SPI
## Taxa de amostragem e tempo ##
SAMPLE_RATE = 2000  # Hertz
DURATION = 2  # Seconds
N = SAMPLE_RATE * DURATION
n = math.floor(math.log(N)/math.log(2))

## Cria uma lista onde serão armazenados os dados lidos pelo pino analogico##
list_y = []
Harm = []

spi = SPI(0, 100000, mosi=Pin(19), sck=Pin(18))

dc = Pin(17)
rst = Pin(20)
cs = Pin(16)



FreqAlto = 400
FreqBaixo = 100
AmpAlto = 2.3
AmpBaixo = 1.3


## Leitura do pino analogico do microfone e armazena na ultima posicao da lista, a cada "utime.sleep_us(100)" segundos##
for i in range(2**n):
    x = machine.ADC(27)
    data = x.read_u16()
    list_y.append(data)
    utime.sleep_us(100)

value = max(list_y)*0.000050354

## Faz a fft do sinal lido anteriormente##
signal = np.array(list_y)
fft_signal = np.fft.fft(signal)
print(fft_signal)

print(len(fft_signal[0]))

#Efao = np.fft.fftfreq()

real = []

#while True:
  #  yf = fft(list_y)
   # xf = fftfreq(N, 1 / SAMPLE_RATE)
real = fft_signal[0]
print(real)


   
lista2 = list(real)


# x = lista2.index(max(lista2))
# ha = x*2.44

x = lista2.index(max(lista2[1:]))
ha = x*2.44

    
    
#print(value)
#print(max(list_y))

#print(ha)





if (value < AmpAlto):


    print("sad")

#     oled.fill(0)
#     oled.show()
#     oled.text("triste",20,20)
#     oled.show()
#     utime.sleep_ms(10)
#     
    
elif (value > AmpAlto):
    
    
    if (ha < FreqBaixo):
        
        print("sad")
#         
#         oled.fill(0)
#         oled.show()
#         oled.text("triste",20,20)
#         oled.show()
#         utime.sleep_ms(10)
        
        
    elif ((ha > FreqBaixo) and (ha < FreqAlto)):
        
        print("neutro")
        
#         oled.fill(0)
#         oled.show()
#         oled.text("triste",20,20)
#         oled.show()
#         utime.sleep_ms(10)
        
        
    elif (ha > FreqAlto):
        
        print("happy")
        
#         oled.fill(0)
#         oled.show()
#         oled.text("triste",20,20)
#         oled.show()
#         utime.sleep_ms(10)
    
    
#print(Harm)


#Freq = max(list_y)




#yf = fft(normalized_tone)
#xf = fftfreq(N, 1 / SAMPLE_RATE)
