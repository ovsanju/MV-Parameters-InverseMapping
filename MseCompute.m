function mseData=MseCompute(inputData,targetData,netNumb)
    inputData=inputData';
    eval(strcat('outputData=Net_',num2str(netNumb),'(inputData);'));
    mseData=sqrt(sum((outputData'-targetData).^2)/length(inputData));
end