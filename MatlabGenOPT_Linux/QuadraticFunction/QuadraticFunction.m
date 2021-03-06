% Author: Marco Bonvini
% Date: 14/06/2011
%
% first of all open the log file
% open the ./MatlabLog.txt file
try
	fid_log = fopen('./MatlabLog.txt','w');
catch
	% error hile opening the Log File
	quit();
end

% open the result file ./result.txt
% if already existing, overwrite it
try
	fid = fopen('./result.txt','w');
	% result file open correctly
	fprintf(fid_log,'%s\n','Result file open correctly');
catch
	% Cannot open the file where write results
	fprintf(fid_log,'%s\n','Matlab Error - Cannot open/create result file');
end

try
	try
		% initialize the values of the cost function and get the input values
		InitialisationScript;
	catch
		% Cannot open the script for initialisation
		% probably it is not in the matlab path
		fprintf(fid_log,'%s\n','Matlab Error - Cannot open Initialisation script');
	end
	
	% compute the cost function
	y = a*x^2 + b*x + c;
catch
	% Cannot compute the cost function
	fprintf(fid_log,'%s\n','Matlab Error - Cannot compute the cost function');
end


try
	% convert the number into a string and print it
	fprintf(fid,'%s\n','# MATLAB Results');
	fprintf(fid,'y = %.10f',y);

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
