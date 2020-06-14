# MPPT-Charge-Controller

**Introduction** | This project was created in the scope of the the class ENGR 460 "Power Engineering" conducted through online learning at Walla Walla University. I was tasked with designing, building, and testing a *Solar Charge Controller*. For more information on the theory and circuit analysis of the design, please refer to the "Wiki" tab.

**Navigation** | This repository consists of several folders. In this "code" tab, you will find 2 main folders: Arduino & KiCAD. Within the Arduino file, you will find a folder containing the code that the charge controller runs on. The KiCAD folder contains the KiCAD project zip file which can be used to replicate the board used in this project

**Results** | The Charge Controller is in working order, there are some bugs with the Display output, and the board has to be slightly modified in this intial revision of the board. For more details visit the "Wiki" tab where the final indepth report is given.

**Status of Project** | Visit the "issues" tab to see errors and fixes for this project - which should provide a more in depth explanation for the quote "status" of the project. Can also visit the "Wiki" page or view the documentation files in the folders for a description of build and test process when troubleshooting issues.

**Credit** | This project was not without help, I would like to thank [Opengreenenergy](https://www.instructables.com/id/ARDUINO-SOLAR-CHARGE-CONTROLLER-Version-30/) for there charge controller design which helped me understand how to go about designing my schematic,I did use a similar block design but I did go about it quite a bit differently for example, to sense current I used the AD812 Current Sensing Op-amp rather than a breakout board,but this was a great resource to start designing and understanding MPPT early in the project especially in the design of the Synchonous Buck Converter. <br />
I'd also like to include [Tim Knowlan](https://github.com/Elexy/SerettaLabs/blob/master/mpptControler/ppt.pde) for allowing me to sample his code for this project. I needed to do some more editting to really squish out all the bugs I'm finding but I was able to get the mosfets driving properly with this code. however I have been unable to get the peripherals to function properly (LED's and I2C Display), this will hopefully be resolved in a future update (see Issues).
