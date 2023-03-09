clear
B=[0,0; 77,68; 12,75; 32,17; 51,64; 20,19; 72,87; 80,37; 35,82;2,15; 18,90; 33,50; 85,52; 97,27; 37,67; 20,82; 49,0; 62,14; 7,60;100,100];
popsize = 100;
genum = 500;
tiledlayout(3,4)
for h = 1:5
for i=1:popsize
    PermPop(i,:) = randperm(18);
end
PermPop = PermPop + 1;

for gen = 1 : genum
    pop = [ones(popsize,1),PermPop,ones(popsize,1)*20];
    fitness=fitU2(pop,B);
    graf(gen)=min(fitness);
    bestpop = selbest(PermPop,fitness,[3,1,1]);
    oldpop = seltourn(PermPop,fitness,10);
    newpop = [seltourn(PermPop,fitness,popsize-20);bestpop];
    newpop = swapgen(newpop,0.1);
    newpop = swappart(newpop,0.1);
    newpop = invord(newpop,0.3);
    newpop = crosord(newpop,0);
    PermPop = [bestpop;newpop;oldpop];
end
farba=round(rand(1,3),3);
res = [1,bestpop(1,:),20];
min(fitness);
hold on; 
figure(1);%dlzka
title('priebeh fitness');
xlabel('generacia');
ylabel('dlzka')
plot(graf,'LineWidth',2,'color',farba);
hold on;
figure(2);
nexttile;
title('graf cesty');
xlabel(min(fitness));
ylabel('y');
X=[];Y=[];

for i=1:20
    x=B(res(i),1); y=B(res(i),2);
    plot(x,y,'ko',LineWidth=2);
    X=[X,x]; Y=[Y,y];
end
line(X,Y,'Linewidth',2,'color',farba); 

minim(h)=min(fitness);
end
disp('min:');disp(min(minim));

function cesta = fitU2(A,B)
[len,wid]= size(A);
for i=1:len
suma = 0;
    for j=2:wid
        suma = suma + sqrt((B(A(i,j-1),1)-B(A(i,j),1))^2 + (B(A(i,j-1),2)-B(A(i,j),2))^2);
    end
    cesta(i) = suma;
end
end