% Author: Marco Bonvini
% Date: 15/06/2011
%
% first of all open the log file
% open the ./MatlabLog.txt file
try
	fid_log = fopen('./MatlabLog.txt','w');
catch
	% error while opening the Log File
	quit();
end

% open the result file ./result.txt
% if already existing, overwrite it
try
	fid = fopen('./result.txt','w');
	% result file open correctly
	fprintf(fid_log,'%s\n','Resul file open correctly');
catch
	% Cannot open the file where write results
	fprintf(fid_log,'%s\n','Matlab Error - Cannot open/create result file');
end

try
	% initialize the values of the cost function and get the input values
	try
		InitialisationScript;
	catch
		% Cannot open the script for initialisation
		% probably it is not in the matlab path
		fprintf(fid_log,'%s\n','Matlab Error - Cannot open Initialisation script');
	end
	
	% in this case, the step response of the controlled system is compared with a desired one
	% the difference between the desired and the obtained one
	% is the cost function
	
	% computing the step response with the actual controller
	s = tf('s');
	P = 1/(1+s*T1)/(1+s*T2);
	PI = K*(1+s*Ti)/(s*Ti);
	L = P*PI;
	[Y T] = step(L/(1+L),time);
	% computing the cost function
	cost = (y_ref-Y')*Q*(y_ref-Y')' + (Y'*C_w*Y);
catch
	% Cannot compute the cost function
	% probably it is not in the matlab path
	fprintf(fid_log,'%s\n','Matlab Error - Cannot compute the cost function');
end


try
	% convert the number into a string and print it
	fprintf(fid,'%s\n','# MATLAB Results');
	fprintf(fid,'y = %.10f',cost);

	% terminated correctly
	fprintf(fid_log,'%s\n','Matlab Terminated correctly');
catch
	% terminated with error
	fprintf(fid_log,'%s\n','Matlab Error - Problem while writing the final result');
end

% close all file
fclose('all');

% close the terminal
quit();
