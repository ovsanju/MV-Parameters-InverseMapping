function [inpPreds dataRecGPSO]=runGPSO(params,nts,testOutp,varRange,trls,inpSz,iterations,freezeVals)

popsz=params.pop;
omg=params.omega;
grps=params.groups;
pInf=params.pbest;
gInf=params.gbest;
uInf=params.ubest;
minVals=varRange.min;
maxVals=varRange.max;
%% Initializing Population
pops=rand(popsz,inpSz).*repmat(maxVals(1:inpSz)-minVals(1:inpSz),popsz,1)+repmat(minVals(1:inpSz),popsz,1);
pops(:,1)=freezeVals(1);
pops(:,2)=freezeVals(2);
vels=rand(popsz,inpSz).*10-5;
persMat=pops;
minMat=repmat(minVals(1:inpSz),popsz,1);
maxMat=repmat(maxVals(1:inpSz),popsz,1);
for trials=1:trls
    for iters=1:iterations
        disp(iters)
        for popCtr=1:popsz
            popFit(popCtr)=mseCompute(pops(popCtr,:),testOutp,nts);
        end
     for popCtr=1:popsz
        persMatFit(popCtr)=mseCompute(persMat(popCtr,:),testOutp,nts);
        if persMatFit(popCtr)>=popFit(popCtr)
            persMat(popCtr,:)=pops(popCtr,:);
       end
     end
    popFit=popFit';
    for gps=1:grps:(popsz-grps+1)
       currPop=pops(gps:(gps+grps-1),:);
       currFit=popFit(gps:(gps+grps-1));
       [bestInGrpVal bestInGrpLoc]=min(currFit); % Minimization Problem always
       bestInGrp=currPop(bestInGrpLoc,:);
      if gps==1
         grpMat=repmat(bestInGrp,grps,1);
      else
          grpMat=[grpMat;repmat(bestInGrp,grps,1)];
      end
    end   % Indentifying groups bests (grpMat)
    [bestInSwrmVal bestInSwrmLoc]=min(popFit);

    bestInSwrm=pops(bestInSwrmLoc,:);
    univMat=repmat(bestInSwrm,popsz,1);
    dataRecGPSO.trial{trials}.pops{iters}=pops;
    dataRecGPSO.trial{trials}.popFit{iters}=popFit;
    dataRecGPSO.trial{trials}.vels{iters}=vels;
    dataRecGPSO.trial{trials}.grpMat{iters}=grpMat;
    dataRecGPSO.trial{trials}.univMat{iters}=univMat;
    dataRecGPSO.trial{trials}.persMat{iters}=persMat;
    dataRecGPSO.trial{trials}.bestFit{iters}=bestInSwrmVal;
    dataRecGPSO.params=params;
    rp=rand(popsz,inpSz);
    rg=rand(popsz,inpSz);
    ru=rand(popsz,inpSz);
    vels=omg.*vels+pInf.*rp.*(persMat-pops)+gInf.*rg.*(grpMat-pops)+uInf.*ru.*(univMat-pops);
    vels(vels<-5)=-5;
    vels(vels>5)=5;
    pops=pops+vels;
    pops(pops<minMat)=minMat(pops<minMat);
    pops(pops>maxMat)=maxMat(pops>maxMat);
    pops(:,1)=freezeVals(1);
    pops(:,2)=freezeVals(2);
 
    
    clear grpMat currPop currFit;

end
dum1(trials)=dataRecGPSO.trial{trials}.bestFit{iterations};
end

[vl lc]=min(dum1);
inpPreds=dataRecGPSO.trial{lc}.univMat{iterations};
inpPreds=inpPreds(1,:);
dataRecGPSO.best.vals=inpPreds;
dataRecGPSO.best.fits=vl;

