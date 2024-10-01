### Analysis of Dopamine Concentrations obtained from Fast-scan Cyclic Voltammetry experiments in _ex vivo_ mouse brain slices
------------------
## System Requirements
Any computer using an operating system capable of running JupyterLab.

**Hardware Requirements**
The computational power needed to run the python code should be well within the capacities of mid-range laptop computers, with, for example:

    * 8gb of RAM 
    * processor with 4 cores of 4.00+GHz 

**Software Requirements**
Jupyter Notebook can be installed on machines running Windows, macOS or Linux. 

------------------
## Installation
To install Jupyter Notebook on a macOS machine, download the installer from [python.org](python.org).

------------------
## Demonstration

**Instructions for use**

The input folder contains raw .abf files named for example "2021_08_03_001.abf", and calibration value. 
The ouput files are:
	 - PDF file with 'raw' voltammogram plots
	 - Processed .csv file named "'InverseDate'.'SliceNumber'.Data.csv" (similar to would come out of axoscope)
	 - PDF file with individual transients
	 - PDF file with aligned transients
	 - Processed .csv file named "'InverseDate'.'SliceNumber'.DataProcessed.csv
  
------------------
## Files
The following file is included in this folder:

**FCV_Complete_Analysis_Code.ipynb**: Code to analyse and plot dopamine concentrations obtained from Fast-scan Cyclic Voltammetry experiments in _ex vivo_ mouse brain slices.
