if isempty(currentFigures), currentFigures = []; end;
close(setdiff(findall(0, 'type', 'figure'), currentFigures))
clear mex
delete *.mexw64
[~,~,~] = rmdir('C:\Sumpurn\gpucoderdemo_in_simulink\codegen','s');
clear C:\Sumpurn\gpucoderdemo_in_simulink\SobelAPI.m
delete C:\Sumpurn\gpucoderdemo_in_simulink\SobelAPI.m
clear C:\Sumpurn\gpucoderdemo_in_simulink\sobelEdge.m
delete C:\Sumpurn\gpucoderdemo_in_simulink\sobelEdge.m
delete C:\Sumpurn\gpucoderdemo_in_simulink\gpucoder_sobelEdge.slx
clear
load old_workspace
delete old_workspace.mat
delete C:\Sumpurn\gpucoderdemo_in_simulink\cleanup.m
cd C:\Sumpurn
rmdir('C:\Sumpurn\gpucoderdemo_in_simulink','s');
