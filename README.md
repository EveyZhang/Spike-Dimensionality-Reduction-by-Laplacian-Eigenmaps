# Spike-Dimensionality-Reduction-by-Laplacian-Eigenmaps
Effective dimensionality reduction for visualizing neural dynamics by Laplacian Eigenmaps

## Introduction

We provide effective dimensionality reduction for visualizing neural dynamics by Laplacian Eigenmaps, which applies the LE method to highlight the similarity and dynamical process of neural population activity. The proposed algorithm is based on the intrinsic properties of neural activity and does not require any external information about motor or cognitive behaviors. Moreover, it represents a robust and credible method for neural population analysis. If our work is helpful to you, please quote our literature: Effective Dimensionality Reduction for Visualizing Neural Dynamics by Laplacian Eigenmaps - G. Sun et al.

## Usage

* Download、clone the git repository of the codes  
* Open Matlab and set the Github folder as the current folder in Matlab  
* laplacian_eigen.m file is the main function of dimensionality reduction algorithm by laplacian eigenmaps. 
There are two examples in the validation folder. 

Example 1. Single Object:     
	* run LE_main SO.m   
	* For argument options, please see LE_main SO.m   
    
Example 2. Turning Table:  
	* run LE_main_TT.m   
	* For argument options, please see LE_main_TT.m   

### Key Parameters:

    S: Original high dimensional data  
    dim: target dimension  
	
### Key Output:

    Low_dim_S: Low dimensionality data

## Dataset

The neural data were collected through the Neural Processing System (Blackrock Microsystems, Salt Lake City, UT) with the 
sampling frequency of 30 kHz and the bandpass filters with the bandwidth of 250 Hz - 7.5 kHz. As a validation, we extracted one-day   data. After the spike count matrix S was generated, we import it into the LE method and reduced its dimensionality to three.  
Here are the visualization of the dataset processing results:  
![](https://github.com/EveyZhang/Spike-Dimensionality-Reduction-by-Laplacian-Eigenmaps/blob/master/image.png)
 

## Validation Codes

files under the Single Object folder

Data_SO.mat  - Spike data and trial event recorded form Single Object task

LE_main_SO.m - Main file for dimensionality reduction of Data_SO data

buildMap.m   - Calculate the number of recorded neurons

binData.m    - Calculate the S matrix by the spike count algorithm

binMark_SO.m - Synchronize trial event of Single Object information to the S matrix

LE_plot_SO.m - Visualize the dimensionality reduction results of Single Object task





-----------------------------------------------------------------------------------

files under the Turning Table folder

Data_LE.mat  - Spike data and trial event recorded form Turning Table task

LE_main_TT.m - Main file for dimensionality reduction of Data_TT data

buildMap.m   - Calculate the number of recorded neurons

binData.m    - Calculate the S matrix by the spike count algorithm

binMark_TT.m - Synchronize trial event of Turning Table information to the S matrix

LE_plot_TT.m - Visualize the dimensionality reduction results of Turning Table task




## Practical Suggestions

### Software

Matlab R2014a and later

### Hardware

* Better hardwares are always preferred, for professional data analysis such as in the regular lab environment, even though the   algorithms can be adapted to personal computers.  
* Typically, a PC with 8G memory is enough.  

### Data Preproccessing

* Data should be stored in the form of matrix, which contains the information of neuron activity in your experiment. To  illustrate, the row of matrix represents each neuron, the column of matrix represents each time bin, and the nerve signal is discretized according to time bin. The matrix stores the discharge rate of each neuron in each time bin.	
* Considering that the spike of neurons will change dramatically, in order to make the curve more smooth, the smoothing method is recommended to reduce the error to a certain extent by taking the mean value of the signal in each time bin according to the adjacent time bin.

## Reference

* Belkin, M., Niyogi, P. (2003). Laplacian eigenmaps for dimensionality reduction and data representation. NEURAL COMPUTATION, 15(6), 1373-1396.
* Suzuki, M. (2015). Manifold Learning and Convergence of Laplacian Eigenmaps (Doctoral dissertation, McGill University Libraries).
