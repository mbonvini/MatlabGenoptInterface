: Script for running the Matlab code
: Author: Marco Bonvini
: Date: 16/06/2011
@echo off
: get the current directory, in this one there will be the initialisationFile provided by GenOpt
set pwd=%cd%
: set the path for Matlab
set command1=path(path,'%pwd%')
: set the directory in which is contained the matlab file to be executed
set command2=path(path,'D:\Dokumente und Einstellungen\MBonvini\Desktop\MatlabGenOPT_Windows\MultivariableFunction')


: Important address - Matlab executable file location
set matlabLocation=C:\Programme\MATLAB\R2007b\bin\matlab
: Options
set matlabOptions=-nojvm -nosplash -nodesktop -wait
: the name of the file that will contain the Cost Function (written in Matlab code)
set fileName=CostFunction

: execute this command
%matlabLocation% %matlabOptions% -r "%command1%;%command2%;%fileName%;"
