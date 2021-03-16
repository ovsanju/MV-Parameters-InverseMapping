function [finalStats]=RunGPSO(paramsGPSO,netNo,targetsInput,targetsOutput,inputRange,totalTrials,inputsCount,maxIters,freezeValIds)

minVals=inputRange.min;
maxVals=inputRange.max;



minMat=repmat(inputRange.min(1:inputsCount),paramsGPSO.pop,1);
maxMat=repmat(inputRange.max(1:inputsCount),paramsGPSO.pop,1);
tic

parfor trials=1:totalTrials
    swarmBest=1000000;
    popPos=rand(paramsGPSO.pop,inputsCount).*repmat(maxVals(1:inputsCount)-minVals(1:inputsCount)...
                    ,paramsGPSO.pop,1)+repmat(minVals(1:inputsCount),paramsGPSO.pop,1);

    velVectors=rand(paramsGPSO.pop,inputsCount).*10-5;
    pBest=popPos;
    trials;
    for iters=1:maxIters
        popPos(:,1)=freezeValIds(1);
        popPos(:,2)=freezeValIds(2);
        [fitVals inputFitVals outPutVals]=MseCompute1(popPos,targetsInput,targetsOutput,netNo,paramsGPSO.pop,inputRange); 
        [pbestFit inputFitVals_PBest outPutVals_PBest]=MseCompute1(pBest,targetsInput,targetsOutput,netNo,paramsGPSO.pop,inputRange); 
        pBest=pBest.*repmat((pbestFit<=fitVals)',1,inputsCount)+popPos.*repmat((pbestFit>fitVals)',1,inputsCount);
        for gps=1:paramsGPSO.groups:(paramsGPSO.pop-paramsGPSO.groups+1)
            groupPop=popPos(gps:(gps+paramsGPSO.groups-1),:);
            groupFit=fitVals(gps:(gps+paramsGPSO.groups-1));
            [bestInGrpVal bestInGrpLoc]=min(groupFit);
            bestInGrp=groupPop(bestInGrpLoc,:);
            if gps==1
               grpMat=repmat(bestInGrp,paramsGPSO.groups,1);
            else
               grpMat=[grpMat;repmat(bestInGrp,paramsGPSO.groups,1)];
            end
        end
 % Computing Universal Best          
    [bestInSwrmVal bestInSwrmLoc]=min(fitVals);
    bestInSwrm=popPos(bestInSwrmLoc,:);

    bestInSwrmOutput= outPutVals(bestInSwrmLoc,:);
    univMat=repmat(bestInSwrm,paramsGPSO.pop,1);
    rp=rand(paramsGPSO.pop,inputsCount);
    rg=rand(paramsGPSO.pop,inputsCount);
    ru=rand(paramsGPSO.pop,inputsCount);
    
    velVectors=paramsGPSO.omega.*velVectors+...
               paramsGPSO.pbest.*rp.*(pBest-popPos)+...
               paramsGPSO.gbest.*rg.*(grpMat-popPos)+...
               paramsGPSO.ubest.*ru.*(univMat-popPos);
    velVectors(velVectors<-10)=-10;
    velVectors(velVectors>10)=10;
    popPos=popPos+velVectors;
    popPos(popPos<minMat)=minMat(popPos<minMat);
    popPos(popPos>maxMat)=maxMat(popPos>maxMat);
    swarmBest=[swarmBest;bestInSwrmVal];
    end
    finalStats{trials}.UnivBestOverIterations=swarmBest(2:end);
    finalStats{trials}.finalUniversalLeaderInputValues=bestInSwrm;
    finalStats{trials}.finalUniversalLeaderOutputValues=bestInSwrmOutput;
    finalStats{trials}.finalUniversalLeaderFitnessOutput=bestInSwrmVal;

    finalStats{trials}.targetInput=targetsInput;
    finalStats{trials}.targetOutput=targetsOutput;
    end
end
