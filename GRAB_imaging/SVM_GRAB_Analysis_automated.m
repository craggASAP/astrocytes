%%%%%%%%%%%%%%%%%%% GRAB sensor imaging data analysis%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all

%% open file extracted from ImageJ (.csv) 
%Need to have the folder containing the .csv file open or add it to path
rawfluo=readmatrix('ROI1.csv'); 

%% optional step: subtract backgound from ROI on the stimulating electrode to correct for non-specific changes in ambient illumination
%all_backgroundfluo=readmatrix('backgrEstim.csv');
%backgroundfluo=all_backgroundfluo(41:50,2);
%average_backgroundfluo=mean(backgroundfluo);
%A1=rawfluo(:,2)-average_backgroundfluo; %backgroud subtraction
%A=[rawfluo(:,1) A1]; %create matrix with frame values and background subtracted fluo values 

%% Set camera exposure and extract frame and fluorescence values
A=rawfluo; 

x=A(:,1); %frames

recording_length=length(x); 

if (recording_length == 20) || (recording_length == 30)
    exposure=100; %camera exposure 100 ms and acquisition frequency 10 Hz
    
elseif (recording_length == 40)  || (recording_length == 70)
    exposure=50; %camera exposure 50 ms and acquisition frequency 20 Hz
    
elseif (recording_length == 100) || (recording_length == 175)
    exposure=20; %camera exposure 20 ms and acquisition frequency of 50 Hz (need to set a smaller recording ROI prior acquisition)
    
else (recording_length == 200) || (recording_length == 350)
    exposure=10; %camera exposure 10 ms and acquisition frequency of 100 Hz (need to set a smaller recording ROI prior acquisition)  
end

time=(x.*exposure)./1000; %total recording time in seconds 

y=A(:,2); %fluorescence values

%% choose pre- and post-peak values to calculate baseline fluorescence (F0) curve
%select points before and after the peak 

if exposure == 10
    A_prepeak=A(1:48,:); %if exposure is 10ms and count is 200 frames
    x_prepeak=A_prepeak(:,1);
    y_prepeak=A_prepeak(:,2);
    
    y_length=length(y);
    if y_length > 200
      A_postpeak1=A(135:148,:); %for 2Hz 5p (186:196)
      A_postpeak2=A(300:end,:); %for 2Hz 5p (290)
      A_postpeak=[A_postpeak1; A_postpeak2];%for 2Hz 5p
    else
     A_postpeak=A(120:end,:);
     %A_postpeak1=A(106:110,:); %for 5Hz 5p (100:105)
     %A_postpeak2=A(160:end,:); %for 5Hz 5p
     %A_postpeak=[A_postpeak1; A_postpeak2];%for 5Hz 5p
    end
    
elseif exposure == 20
    A_prepeak=A(1:22,:);
    x_prepeak=A_prepeak(:,1);
    y_prepeak=A_prepeak(:,2);
    
    y_length=length(y);
    if y_length > 100
        A_postpeak1=A(63:67,:); %esposure 20 ms (50 Hz) 2Hz trains
        A_postpeak2=A(93:97,:); 
        A_postpeak3=A(160:end,:); 
        A_postpeak=[A_postpeak1; A_postpeak2; A_postpeak3];
    else
    A_postpeak=A(61:end,:); %exposure 20 ms (50 Hz)
    end
    
elseif exposure == 50
    A_prepeak=A(1:9,:);
    x_prepeak=A_prepeak(:,1);
    y_prepeak=A_prepeak(:,2);
    
    y_length=length(y);
    if y_length > 40
        A_postpeak1=A(24:27,:); %esposure 50 ms (20 Hz) 2Hz trains
        A_postpeak2=A(44:47,:); 
        A_postpeak3=A(57:69,:); 
        A_postpeak=[A_postpeak1; A_postpeak2; A_postpeak3];
    else
        A_postpeak=A(30:end,:);
    end
    
elseif exposure == 100
    A_prepeak=A(1:5,:);
    x_prepeak=A_prepeak(:,1);
    y_prepeak=A_prepeak(:,2);
    
    y_length=length(y);
    if y_length > 20 
        A_postpeak1=A(13:14,:); %esposure 100 ms (10 Hz) 2Hz trains
        A_postpeak2=A(18:19,:); 
        A_postpeak3=A(30:end,:); 
        A_postpeak=[A_postpeak1; A_postpeak2; A_postpeak3];
    else 
        A_postpeak=A(12:end,:); %exposure 100 ms
    end
        
end
    
x_postpeak=A_postpeak(:,1);
y_postpeak=A_postpeak(:,2);

%put together pre- and post-peak values to fit exponential decay curve
x_forFit=[x_prepeak; x_postpeak];
y_forFit=[y_prepeak; y_postpeak];

Fit=fit(x_forFit, y_forFit, 'exp2')

%plot raw fluorescence, pre- and post-peak values and fitted exponential decay
figure(1)
plot(x,y)
hold on
plot(Fit)
hold on
plot(x_forFit,y_forFit)
legend('raw transient','fitted curve','values for fit')

%% Calculate dF=F-F0 
%subtract the equation obtained from Fit function (which is my baseline
%fluorescence F0) from the raw fluorescence values (F)

fitted_transient=Fit.a*exp(Fit.b*x) + Fit.c*exp(Fit.d*x);
baselinecorrected=y-fitted_transient;

%plot the subtracted transient
figure(2)
plot(baselinecorrected, 'k')
legend('subtracted transient')

%% Calculate dF/F0= (F-F0)/F0
%deltaF/F0 calculated as Ft (Fluo values at each datapoint)
%minus F0 (baseline fluo from the fitted curve) divided by F0

deltaF=(y-fitted_transient)./fitted_transient;

figure(3)
plot(time, deltaF, 'r')
legend ('deltaF/F0')

%% calculate the deltaF/F0 as percentage, the peak deltaF/F0 and the area under the curve (AUC)
deltaF_percentage=deltaF.*100;

if exposure == 10
    forpeak=deltaF(41:end); %100 Hz sampling (exposure 10 ms)
      
elseif exposure == 20
    forpeak=deltaF(22:end); %50 Hz sampling (exposure 20 ms)
    
elseif exposure == 50
    forpeak=deltaF(8:end); %20 hz sampling (exposure 50 ms)
    
elseif exposure == 100
    forpeak=deltaF(4:end); %10 Hz sampling (exposure 100 ms)
       
end

%peak value
peak=max(forpeak);
peak_percentage=peak.*100; 

%area under the curve from where stimulation starts to end of transient (constant for ALL stims/drug conditions)
AUC=trapz(forpeak);

%F0 values (fluo value on baseline corresponding to PEAK value)
pos=find(deltaF==peak); %find in which position is the peak 
F0=fitted_transient(pos); %find the corresponding F value in fitted_transient

%% Export values to a .csv file
toExport=zeros(350,9);
toExport(1:length(time),1)=time;
toExport(1:length(deltaF),2)=deltaF;
toExport(1:length(deltaF_percentage),3)=deltaF_percentage;
toExport(1:length(peak),4)=peak;
toExport(1:length(peak_percentage),5)=peak_percentage;
toExport(1:length(AUC),6)=AUC;
toExport(1:length(F0),7)=F0;
  
filename='/Users/stefaniavietti/Desktop/GACh/FCV PREP/test.csv'; %need to change name according to stim
writematrix(toExport, filename);
  
%use combineData.m code to concatenate all .csv files resulting from each
%individual stimulus when running this code. Note that data are in the
%format [time; deltaF/F0; deltaF/F0_percentage; peak; peak_percentage; AUC; F0 peak]