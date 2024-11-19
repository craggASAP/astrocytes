# Supplemental code for "Rapid modulation of striatal cholinergic interneurons and dopamine release by satellite astrocytes"

------------------
## Contents
* [Project Overview](#project-overview)
* [Folder Structure](#folder-structure)
* [License and citation](#license-and-citation)
* [Acknowledgements](#acknowledgements)

------------------
## Project Overview
This repository contains scripts used to (1) analyse and plot dopamine concentrations from Fast-scan Cyclic Voltammetry (FCV) experiments performed in _ex vivo_ mouse brain slices; (2) plot electrophysiology traces from patch-clamp experiments in _ex vivo_ mouse brain slices, (3) measure acetylcholine levels from GRAB sensor imaging in _ex vivo_ mouse brain slices, and (4) determine the proximity of cell types using mathematical modelling. These scripts were custom-written by Jeffrey Stedehouder, Stefania Vietti-Michelina and Professor Kevin McGerty and used in the study ["Rapid modulation of striatal cholinergic interneurons and dopamine release by satellite astrocytes"](https://www.biorxiv.org/content/10.1101/2024.05.15.594341v1).

------------------
## System Requirements
Any computer using an operating system capable of running Python v3 and Jupyter Notebook, an interactive computational environment to manipulate and analyse data using Phyton. Alternatively, any computer with a web-browser and an internet connection with reasonable capacity (see Alternative Installation within the README.md file in the folder "Maths_Model")

**Hardware Requirements**
The computational power needed to run the python code should be well within the capacities of mid-range laptop computers, with, for example:

    * 8gb of RAM 
    * processor with 4 cores of 4.00+GHz 

**Software Requirements**
Python, Jupyter Notebook and MATLAB can be installed on machines running Windows, macOS or Linux. The latest version of Python can be downloaded from [python.org](python.org) which provides installers for the operating systems mentioned above. Jupyter Notebook can be downloaded from [Python Package Index](https://pypi.org/search/?q=Jupyter). MATLAB software requires a paid subscription to be used. More details [here](https://uk.mathworks.com/products/matlab.html).

------------------
## Folder Structure
The following folders are included in this repository:

**FCV**: Analysis of Fast-scan Cyclic Voltammetry (FCV) outputs.

**Patch-Clamp**: Plot electrophysiology traces from patch-clamp experiments. 

**Maths_Model**: All original phyton code used for mathemical predictions of geometrically expected mean minimum distances between ChIs or SPNs and their nearest astrocyte.

**GRAB_imaging**: Measure fluorescence changes in GRAB sensor images. 

------------------
## License and Citation
This repository is released under the [MIT License](https://opensource.org/license/mit) - see the [LICENSE](LICENSE) file for details.

If you use use this code in your research, please cite:

Stedehouder, J., Roberts, BM., Raina, S., Bossi, S., Liu, A.K.L., Doig, N.M., McGerty, K., Magill, P.J., Parkkinen, Cragg, S.J. (2024) - Rapid modulation of striatal cholinergic interneurons and dopamine release by satellite astrocytes.  

------------------
## Acknowledgements
This research was funded in part by Aligning Science Across Parkinson’s [ASAP-020370] through the Michael J. Fox Foundation for Parkinson’s Research (MJFF).
