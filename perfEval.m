function netData=perfEval(nts,inpPreds,testInp,testOutp,simData)



 eval([strcat('outpPreds=Net_',num2str(nts),'(inpPreds)')]);
        perfNet_inp=sqrt(sum((inpPreds'-testInp).^2)/length(inpPreds));
        perfNet_outp=sqrt(sum((outpPreds'-testOutp).^2)/length(testOutp));
        netData.predInput=inpPreds;
        netData.predOutput=outpPreds;
        netData.performance.Input=perfNet_inp;
        netData.performance.Output=perfNet_outp;
        netData.simData=simData;
        
end