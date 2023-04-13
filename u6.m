clear
load CTGdata.mat 
NDATA = transpose(NDATA);
arrtr = [];
arrts = [];
best =[];
A = [];
target = zeros(3,size(typ_ochorenia,1));      
for xd = 1:10
for i=1:size(typ_ochorenia,1)
   if typ_ochorenia(i) == 1
       target(typ_ochorenia(i),i) = 1;
   else
       if typ_ochorenia(i) == 2
           target(typ_ochorenia(i),i) = 1;
       else
           target(typ_ochorenia(i),i) = 1;
       end
   end      
end


vystup = target;
arr = [];

net = patternnet(20);
A = [A;net];

net.divideFcn = 'dividerand';

net.divideParam.trainRatio = 0.6; 
net.divideParam.valRatio = 0;
net.divideParam.testRatio = 0.4;

net.trainParam.goal = 0.001;      
net.trainParam.epochs = 200;     
net.trainParam.min_grad = 1e-20;  
net.performFcn = 'msereg';
% net.performFcn = 'mse';
% net.performFcn = 'sse';
% net.performFcn = 'mae';

[net,tr] = train(net,NDATA,vystup);
outputs = net(NDATA);

outputstrain=net(NDATA(:,tr.trainInd));
outputstest=net(NDATA(:,tr.testInd));
trainTargets=target(:,tr.trainInd);
testTargets=target(:,tr.testInd);

[c,cm] = confusion(vystup,outputs);
[c_train,cm_train] = confusion(trainTargets,outputstrain);
[c_test,cm_test] = confusion(testTargets,outputstest);


fprintf('all:%d %.4f%% train: %.4f%% test: %.4f%% \n',xd, 100*(1-c), 100*(1-c_train), 100*(1-c_test));
best = [best;100*(1-c)];
arrtr = [arrtr;100*(1-c_train)];
arrts = [arrts;100*(1-c_test)];
end

[val,idx] = max(best);

trmin = min(arrtr);
trmax = max(arrtr);
travg = mean(arrtr);
tsmin = min(arrts);
tsmax = max(arrts);
tsavg = mean(arrts);
fprintf("train ->   max: %.4f min: %.4f priemer: %.4f\n",trmax,trmin,travg);
fprintf("test  ->   max: %.4f min: %.4f priemer: %.4f\n",tsmax,tsmin,tsavg);