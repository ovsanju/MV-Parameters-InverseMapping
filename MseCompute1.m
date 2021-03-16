function [mseData mseInput outputVals]=MseCompute1(inputData,targetInput,targetOutput,netNumb,popSz,varRange)
    
%% This computes MSE on normalized data
    inpSize=size(inputData);
    inputNormalized=(inputData-varRange.min(1:inpSize(2)))./(varRange.max(1:inpSize(2))-varRange.min(1:inpSize(2)));
    targetInputNormalized=(targetInput-varRange.min(1:inpSize(2)))./(varRange.max(1:inpSize(2))-varRange.min(1:inpSize(2)));
    targetOutputNormalized=(targetOutput-varRange.min(end-length(targetOutput)+1:end))./(varRange.max(end-length(targetOutput)+1:end)-varRange.min(end-length(targetOutput)+1:end));

 % Output Prediction from NNs for each Population Member
    for pops=1:popSz
        outputSample=eval(strcat('Net_',num2str(netNumb),'(inputData(pops,:)'')'';'));
        
        % The following line can be uncommented if output clamping is
        % desired
        
%         outputSample=outputSample.*(outputSample<=varRange.max(end-length(targetInput)+1:end) & (outputSample>=varRange.min(end-length(targetInput)+1:end)))+...
%                        varRange.min(end-length(targetInput)+1:end).*(outputSample<=varRange.min(end-length(targetInput)+1:end))+...
%                     varRange.max(end-length(targetInput)+1:end).*(outputSample>=varRange.max(end-length(targetInput)+1:end));
        outputData(pops,:)=outputSample;
    end
% Normalizing Output
    outputNormalized=(outputData-varRange.min(end-length(targetOutput)+1:end))./(varRange.max(end-length(targetOutput)+1:end)-varRange.min(end-length(targetOutput)+1:end));
% MSE Output this is over normalized output.
    mseData=sum((outputNormalized'-repmat(targetOutputNormalized,popSz,1)').^2)/popSz;
    mseInput=sum((inputNormalized'-repmat(targetInputNormalized,popSz,1)').^2)/popSz;
    outputVals=outputData;
end