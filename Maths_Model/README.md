### Mathematical modelling the proximity of cell types
------------------
## Installation
To install Python v3 on a Windows machine, download the installer from [python.org](python.org). The installer, when run, will offer two installation options, a standard install, Pip Windows, and a customizable install. The standard installation provides everything necessary for our code, and offers by default to also install the IDLE development environment and the PIP package installer. The latter is necessary to install two packages used in the code. The former is a popular environment for producing code, but there are others, such as the Visual Studio Code (available [here](https://code.visualstudio.com/download)). 

The Python packages the code requires can be installed from terminal using PIP: 

	(terminal) pip install  numpy matplotlib

*Total installation time*: 5-10 minutes.

**Alternative Installation**

There are cloud instances of Python which are freely accessible, thus the code can be tested on any computer with a web-browser such as Chrome and an internet connection. 

The code for model 2 can be run on instance accessible [here](https://www.programiz.com/python-programming/online-compiler/)  

The code used to generate the histograms was run using the "Try it yourself" compiler available [here](https://www.w3schools.com/python/trypython.asp?filename=demo_default) (where one should of course delete the "hello world" sample code).

------------------
## Demonstration
The website w3schools.com, in addition to the "Try it yourself" compiler, provides a host of examples of different features of Python in its [online tutorial](https://www.w3schools.com/python/).

**Instructions for use**

The code for model 2 can be run in Python by downloading and running code-model2.py. It request as input the reciprocals of the cell densities of two cell-types, and the mean radius of the larger cell-type, using units of $\mu m^3$ and $\mu m$ respectively. 

To produce a histogram, run the histogram.py code, for example on the w3schools website by copying the code into the editor on the left-hand side of the webpage. The code has 2 parameters for each cell-type, dx and rx corresponding to cell-type x and dy and ry corresponding to cell-type y. The dx parameter is the reciprocal of the density of cell-type x, in $\mu m^{3}$, and the rx parameter is the mean radius of a cell of type x, (and dy and ry the corresponding parameters for cell-type y). To produce a histogram, alter the 4 parameters to your desired values and run the code. 

------------------
## Files
The following files are included in this folder:

**code-model2.py**: Code for model 2 described in the methods section of the study "Rapid modulation of striatal cholinergic interneurons and dopamine release by satellite astrocytes"

**histogram.py**: Code to produce the histograms (based on $10^3$ samples).
