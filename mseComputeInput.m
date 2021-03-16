function [mseData mseInput outputVals]=mseComputeInput(inputData,targetInput,targetOutput,netNumb,varRange)
    
%% This computes MSE on normalized data
    inpSize=size(inputData);
    inputNormalized=(inputData-varRange.min(1:inpSize(2)))./(varRange.max(1:inpSize(2))-varRange.min(1:inpSize(2)));
    targetInputNormalized=(targetInput-varRange.min(1:inpSize(2)))./(varRange.max(1:inpSize(2))-varRange.min(1:inpSize(2)));
    targetOutputNormalized=(targetOutput-varRange.min(end-length(targetOutput)+1:end))./(varRange.max(end-length(targetOutput)+1:end)-varRange.min(end-length(targetOutput)+1:end));

 % Output Prediction from NNs for each Population Member

        outputSample=eval(strcat('Net_',num2str(netNumb),'(inputData'')'';'));
        
        outputData=outputSample;

% Normalizing Output
    outputNormalized=(outputData-varRange.min(end-length(targetOutput)+1:end))./(varRange.max(end-length(targetOutput)+1:end)-varRange.min(end-length(targetOutput)+1:end));
% MSE Output this is over normalized output.
    mseData=sum((outputNormalized-targetOutputNormalized).^2)/length(outputData);
    mseInput=sum((inputNormalized.^2-targetInputNormalized).^2)/length(inputData);
    outputVals=outputData;
end