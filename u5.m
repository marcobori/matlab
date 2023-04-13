load('datafun.mat')
%10 %50 %500
net=fitnet(50);

net.divideFcn='divideind'; 
net.divideParam.trainInd=indx_train;
net.divideParam.testInd=indx_test;

net.trainParam.goal = 1e-7;  
net.trainParam.epochs = 200;
net.trainParam.show = 5;       

net=train(net,x,y);
otpt = sim(net,x);

SSE_tr = sse(net, y(indx_train),net(x(indx_train)))
MSE_tr = mse(net, y(indx_train),net(x(indx_train)))
MAE_tr = mae(net, y(indx_train),net(x(indx_train)))
SSE_tst = sse(net, y(indx_test),net(x(indx_test)))
MSE_tst = mse(net, y(indx_test),net(x(indx_test)))
MAE_tst = mae(net, y(indx_test),net(x(indx_test)))

figure;
plot(x,y,'r',x,otpt,'or',x(indx_train),y(indx_train),'_b', x(indx_test), y(indx_test), '*g');


