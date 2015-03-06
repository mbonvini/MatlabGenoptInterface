#!/bin/sh
# Script for running the Matlab code
# Author: Marco Bonvini
# Date: 14/06/2011
# script that executes the matlab function

matlab_home='/usr/share/matlab/bin/matlab'
matlab_options=' -nojvm -nodesktop -nosplash'

add_path="path(path,'/home/marco/Desktop/MatlabGenOPT/QuadraticFunction')";
add_path2="path(path,'$PWD')";

function_name='QuadraticFunction'

$matlab_home $matlab_options -r "$add_path ; $add_path2 ; $function_name;"
