% Demo program na klasifikaciu predmetov skupiny A a B na základe vlastností V1 a V2 
% NS má 2 vstupy veliciny V1,V2 o rozsahu 0-1 (0-100%) a 2 výstupy o rozsahu 0-1, 
% kde hodnota 1.výstup prislúcha skupine A a  2. výstup skupine B

echo on
% vykreslenie bodov skupín

A = importdata("databody.mat");
% vstupné data pre NS
V1=A.data1;
V2=A.data2;
V3=A.data3;
V4=A.data4;
V5=A.data5;
X=[V1;V2;V3;V4;V5]';

% výstupne data pre NS
P=[ones(50,1) zeros(50,1) zeros(50,1) zeros(50,1) zeros(50,1);
zeros(50,1) ones(50,1) zeros(50,1) zeros(50,1) zeros(50,1);
zeros(50,1) zeros(50,1) ones(50,1) zeros(50,1) zeros(50,1);
zeros(50,1) zeros(50,1) zeros(50,1) ones(50,1) zeros(50,1);
zeros(50,1) zeros(50,1) zeros(50,1) zeros(50,1) ones(50,1)]';


% vytvorenie struktury NS na klasifikaciu
net = patternnet([10])

% vsetky data pouzite na trenovanie
net.divideFcn='dividerand';
net.divideParam.trainRatio=0.8;
net.divideParam.valRatio=0;
net.divideParam.testRatio=0.2;

net.trainParam.goal = 0.01;	    % Ukoncovacia podmienka na chybu SSE.
net.trainParam.epochs = 100;  	    % Max. pocet trénovacích cyklov.

net.trainParam.min_grad=1e-10;      % Ukoncovacia podmienka na min. gradient

% trenovanie siete
net = train(net,X,P);

% simulacia vystupu NS
y = net(X);
% vypocet chyby siete
perf = perform(net,P,y);

% priradenie vstupov do tried
classes = vec2ind(y);


% X2=[0.3 0.5 0.7 0.5 0.5;0.6 0.3 0.2 0.8 0.5; 0.8 0.3 0.6 0.7 0.4];
X2=[0.3 0.5 0.7 0.5 0.5;0.6 0.3 0.2 0.8 0.5; 0.8 0.3 0.6 0.7 0.4];
y2 = net(X2);
classes2 = vec2ind(y2);
X2=transpose(X2);


h=figure;
hold on
plot3(V1(:,1),V1(:,2),V1(:,3),'b.');
plot3(V2(:,1),V2(:,2),V2(:,3),'c.');
plot3(V3(:,1),V3(:,2),V3(:,3),".",'color', [0.9290 0.6940 0.1250]);
plot3(V4(:,1),V4(:,2),V4(:,3),'g.');
plot3(V5(:,1),V5(:,2),V5(:,3),'k.');
plot3(X2(:,1),X2(:,2),X2(:,3),'r*');

axis([0 1 0 1 0 1]);
xlabel('x');
ylabel('y');
zlabel('z');