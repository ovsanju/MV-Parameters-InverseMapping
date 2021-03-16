clc;
clear all;
close all;
load('dataAfterNNTrain.mat');
addpath('/bestNNs');
gpso.pop=200;
gpso.omega=0.8;
gpso.groups=5;
gpso.pbest=1.2;
gpso.gbest=1.2;
gpso.ubest=1.2;

trls=100;
inpSz=8;
iterations=100;
varRange.min=min(combinedMatPred);
varRange.max=max(combinedMatPred);


for dataSt=1:10
    tic
    dataSt
    testSample=testData(dataSt,:);
    testInp=testSample(1,1:8);
    varRange.min=min(combinedMatPred);
    varRange.max=max(combinedMatPred);
    testOutp=testSample(1,9:end);
    for nts=1:10
        nts
        [finalStats]=RunGPSO(gpso,nts,testInp,testOutp,varRange,trls,inpSz,iterations,testInp(1:2));
        Nets{nts}=finalStats;
    end
    save(strcat('dataSt_',num2str(dataSt)),'Nets','-v7.3')
end

%%
ntNo=1;

for trials=1:trls
    finalVals(trials,:)=Nets{ntNo}{trials}.finalUniversalLeaderValues;
end

figure;boxplot(finalVals(3,:))
hold on; plot(mean(finalVals(:,3)),'*g')

