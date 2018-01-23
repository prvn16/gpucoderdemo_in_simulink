%% Generate CUDA code and MEX function
% Setup the input for code generation and create a configuration for GPU code
% generation.
% inputImage = imread('foggyInput.png');

Isize = "{single(zeros(240, 320))}";

%% Run Code Generation

rr= RoboNouMiChiClass(1,2);
genCodeOnlyValue = true;
rr.genCode('lib','sobelEdge','embed','normal',genCodeOnlyValue, Isize);

