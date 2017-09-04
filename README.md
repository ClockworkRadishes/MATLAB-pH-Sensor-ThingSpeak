**Group Member Names:** Erin L McNeill, Gunter Roehrig, Adam Kennedy, Joseph Whom  
**Course and Quarter:** Engineering 114 Summer 2017  
**Date:** September 5, 2017  
**Revision:** 2  
# Problem Statement
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In the artificial, closed environment of an aquaponics set-up, a healthy state of equilibrium must be established through the microbial breakdown of nitrogen-rich wastes produced by fish. This waste, processed by nitrifying bacteria, becomes accessible to plants fed by water circulated from the aquarium portion via a pump. The cycling of this pump facilitates a steady circulation of waste-rich water to the bacteria to process ammonia and dissolved nitrites, which lower the ambient concentrations of accumulated waste which become fatal in high concentrations to the fish and plants.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;As a means to assess, on a cursory but effective level, these concentrations of ammonia, nitrites, and nitrates present from fish waste and decomposing fish food in the Sylvania engineering lab building’s aquaponic setup, a probe will measure the water’s pH. This measurement of pH will be logged for data-keeping, and will be implemented in the activation of a pump relay to help maintain an acceptable pH.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To achieve this outcome, our group will use a pH sensor connected to a Sparkfun RedBoard via a Vernier sensor shield. Driven by an Arduino program, pH readings will be taken over set intervals to be processed through MATLAB and uploaded to ThingSpeak, a site suited for APIs and Internet of Things applications. From ThingSpeak, users can observe past and current pH levels of the tank, and this information can be used to operate the additional pump relay system in tandem development.
# Hardware Setup
### Bill of Materials
|Part Name       |Item Name                   |Link|Purpose                     |Price (USD)|
|----------------|----------------------------|----|----------------------------|----------:|
|Arduino         |Sparkfun RedBoard           |[Link](https://www.sparkfun.com/products/13975)|Hardware                    |19.95      |
|pH Sensor       |Vernier pH Sensor PH-BTA    |[Link](https://www.sparkfun.com/products/12872)    |Measure pH                  |78.95      |
|Sensor Shield   |Sparkfun Vernier Interface  |[Link](https://www.sparkfun.com/products/12858)    |pH sensor/Arduino interface |24.95      |
|Bread board     |Breadboard - Self-adhesive  |[Link](https://www.sparkfun.com/products/12002)    |Electronic circuit builder  |4.95       |
|Bread board base|Arduino & Breadboard holder |[Link](https://www.sparkfun.com/products/11235)    |Holds breadboard & Arduino  |3.95       |
|Mini-USB Cable  |Mini-USB cable - 6ft.       |[Link](https://www.sparkfun.com/products/11301)    |Connects Arduino to computer|3.95       |
|                |                            |    |Total                       |136.70     |

## Hardware Schematic
![Hardware connection diagram](/images/redboard_connection.png "Hardware Connection")
 ## Hookup Guide
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The hardware was connected in this order: ph sensor -> Vernier shield -> Sparkfun Redboard -> mini usb -> laptop. The pH sensor is the Vernier SEN -12872, which was connected to the first analog BTA input on the shield with a white BTA (British Telecom Analog) connector.  The SparkFun Vernier Interface Shield Dev-12858 ROHS was connected to the Sparkfun RedBoard DEV-13975 ROHS by positioning it above the Redboard with the pins from the shield lined up with the Redboard’s headers, where the white BTA connectors are on the bottom and the SparkFun RedBoard’s usb input connector is on the top, and finally connecting them by gently pushing down until the boards are connected as one piece.  Finally, the hardware is connected to a laptop by a mini-usb cable, in our case a red mini-B USB cable CAB-11301 ROHS that was 6-foot long connected to the Redboard’s mini- usb female connector next to the reset button on the board.

### Step One
Align the Vernier shield pins with those on the Arduino Redboard, and press them together firmly.  
![](/images/hw1.png)


### Step Two
With the Vernier sensor shield properly secured into the RedBoard, connect the pH probe to the analog 1 port.  
![](/images/hw2.png)


### Step Three
The pH probe, pictured here in its storage solution, will measure the aquarium’s water pH.
![](/images/hw3.png)


### Step Four
Connecting this hardware setup to a laptop running MATLAB, the pH levels are uploaded to a ThingSpeak channel.
![](/images/hw4.png)


# About The Implemented Code
### Arduino Code
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The [Arduino sketch](/pH_sensor_v_0.8.24.ino), as written by Joseph Whom, was uploaded onto the RedBoard via the Arduino IDE.
### MATLAB Code
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The [Matlab script](/ph_stable.m), as written by Gunter Roehrig, is implemented through a platform using MATLAB, connected to the internet.
# Results
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The following results from the pH sensor are based off buffer solutions of an acidic pH 5, a neutral pH 7, and a basic pH 10. This verifies the accuracy of the probe’s ability to properly measure the conditions of the aquarium’s water once put in operation. All results are taken from readings uploaded to ThingSpeak.

### pH 5 Buffer Solution
![](/images/pH_5.png "")
### pH 7 Buffer Solution
![](/images/pH_7.png "")
### pH 10 Buffer Solution
![](/images/pH_10.png "")
# Future Work
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A question that presents itself most prominently from contributing to this IoT project, especially pertaining to the aquaponics setup, is the utility in using pH data to activate or deactivate the pump circulating water throughout the tank and supplying nutrients to the upper level of plants. If the most anticipated change in pH is the indicative increase due to an excess of waste ammonia, a weak base, the issue at hand wouldn’t be a matter of poor circulation in an aquaponics setup, but rather an effect of a fundamental imbalance in the waste cycle of the aquaponics setup. An excessive amount of ammonia in the water would either be indicative of a compromised microbial environment unable to nitrify the quantities of waste dispersed in the aquarium, or an excessive amount of waste produced by too large a population of fish. If the nitrifying bacteria are unable to digest this waste into nutrients for the plants, the concentrations of nitrites and ammonia will increase until the equilibrium is such that the fish will die and the plants will suffer. 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rather than use significant trends in pH data to trigger a pump relay, the information could be used to send informed alerts that could relate to particular conditions with troubleshooting options the user could take, as well as implement a properly metered relay system to dose mitigating amounts of some proton-donating liquid that could return the pH to a healthier state with any resulting salts being non toxic to both the fish and plants.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Future groups can attempt to use the MatLab GUIDE to create a GUI interface to control frequency of readings, frequency of updates, and a pH sensor calibration mode (ability to enter a custom voltage-to-pH equation). This would allow users to make on-the-fly changes to the way the code is run, without having to modify the code directly.



# License
Below are the license(s) that can be attributed to our ability to complete this work freely.

GNU General Public License v3.0
