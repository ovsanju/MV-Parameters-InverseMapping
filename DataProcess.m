clc;
clear all;
load('dataAfterNNTrain.mat');
totalNets=10;
totalTrials=100;
plotCntr1=1;
plotCntr2=1;
ylimits=[50,15,30,150,50,120]
f1=figure;
f2=figure;
[ha, pos] = tight_subplot(3,6,[.01 .03],[.1 .03],[.01 .03])
dataSetCntr=1;
for dataSet=[10,6,7]



cntr=1;
load(strcat('dataSt_',num2str(dataSet)));
varRange.min=min(combinedMatPred);
varRange.max=max(combinedMatPred);


for nets=1:totalNets
    for trials=1:totalTrials
       netValues=Nets{nets}{trials};
       finalInputValues(cntr,:)=netValues.finalUniversalLeaderInputValues;
       finalFitness(cntr,:)=netValues.finalUniversalLeaderFitnessOutput;
       allFitness{cntr}=netValues.UnivBestOverIterations;
       targetInput=netValues.targetInput;
       cntr=cntr+1;
    end
end


%% Plot Stats graphs
% figure(f1);hold on;
% sz=size(finalInputValues);
% [fitBestVal fitBestLoc]=min(finalFitness);
% fitBestVals(dataSet)=fitBestVal;
% finalBestInputVal=finalInputValues(fitBestLoc,:);
% for clms=3:sz(2)
%     subplot(3,6,plotCntr1);
%     boxplot(finalInputValues(:,clms));
%     hold on;
%     plot(mean(finalInputValues(:,clms)),'*g');
%     plot(finalBestInputVal(clms),'*m');
% %     plot(targetInput(clms),'*r');
% bar([2],[targetInput(clms)],'BarWidth', 0.25)
% %     yline(targetInput(clms),'--r');
%      xlim([0.5,2.5])
%     ylim([varRange.min(clms)-varRange.min(clms)*0.5,varRange.max(clms)+varRange.max(clms)*0.5]);
%     grid on; 
%     if(plotCntr1==1)
%         
%        label('all','','','Test - 1'); 
%         
%     end
%     if(plotCntr1==7)
%         label('all','','','Test - 2'); 
%     end
%     
%     if(plotCntr1==13)
%         label('all','','','Test - 3'); 
%     end
%     
%     
%     plotCntr1=plotCntr1+1;
% end

%% Error Plot with std
figure(f2);hold on;
sz=size(finalInputValues);
[fitBestVal fitBestLoc]=min(finalFitness);
nNumb=round(fitBestLoc/100)
finalBestInputVal=finalInputValues(fitBestLoc,:);
fitBestVals(dataSet)=fitBestVal;
fitBestVal

fitBestInput=mean(finalInputValues)
targetInput
fprintf('%.30f\n',fitBestVal)
[mseData mseInput outputVals]=mseComputeInput(fitBestInput,targetInput,testData(dataSet,9:end),nNumb,varRange);
mseData
mseInput
outputVals


for clms=3:sz(2)
%     subplot(3,6,plotCntr2);
    axes(ha(plotCntr2))
    mnFinalVals=mean(finalInputValues(:,clms));
    stdFinalVals=std(finalInputValues(:,clms));
    
    boxplot(finalInputValues(:,clms));hold on;
    bar([2],[targetInput(clms)],'BarWidth', 0.25);hold on;
    errorbar(2,mnFinalVals,stdFinalVals,'s','MarkerFaceColor','g','MarkerSize',9,'Color','k');
    hold on;

%     plot(finalBestInputVal(clms),'*m');
%     plot(targetInput(clms),'*r');
%     yline(targetInput(clms),'--r');

     xlim([0.5,2.5])
     ylim([0 ylimits(clms-2)])
%     ylim([varRange.min(clms)-varRange.min(clms),varRange.max(clms)+varRange.max(clms)]);
    set(gca,'xtick',[])
%     xlim([0.5,1.5])
    grid on; 
        if(plotCntr2==1)
        
       ylabel('Test - 1'); 
        
    end
    if(plotCntr2==7)
        ylabel('Test - 2'); 
    end
    
    if(plotCntr2==13)
        ylabel('Test - 3'); 
    end
    
    if(plotCntr2==13)
        xlabel('SetP')
    end
    
    if(plotCntr2==14)
        xlabel('PEEP')
    end
    if(plotCntr2==15)
        xlabel('PSV')
    end
    if(plotCntr2==16)
        xlabel('ActRR')
    end
    if(plotCntr2==17)
        xlabel('SetRR')
    end
    if(plotCntr2==18)
        xlabel('FiO2')
    end
    
    
    plotCntr2=plotCntr2+1;
    dataSetCntr=dataSetCntr+1;
end



end

