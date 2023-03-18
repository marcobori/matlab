clc , clear;
popsize = 100;
pop=genrpop(popsize,[0*ones(1,5); 10000000*ones(1,5)]);
gensize = 2000;
for gen=1:gensize
     Fit=stupokuta(pop);
%      Fit=mierapokuta(pop);  %zakomentuj pre 
%      Fit=mrtvapokuta(pop);  %vsetky pokuty
     graf1(gen)=max(Fit);
     best1=selbest(pop,-Fit,[2,1,1]);
     newpop=seltourn(pop,-Fit,popsize - 4);  
     %newpop=crossov(newpop,1,0);
     newpop=mutx(newpop,0.5,[0*ones(1,5); 10000000*ones(1,5)]);
     newpop=muta(newpop,0.5,100000*[1 1 1 1 1],[0*ones(1,5); 10000000*ones(1,5)]);
     newpop=muta(newpop,0.9,1000*[1 1 1 1 1],[0*ones(1,5); 10000000*ones(1,5)]);
     pop=[best1; newpop]; 
end
S = ['stupnovita->',num2str(max(Fit))];
disp(S);
%pre vykreslenie jednotlivych grafov 

pop=genrpop(popsize,[0*ones(1,5); 10000000*ones(1,5)]);
for gen=1:gensize
     Fit=mierapokuta(pop);
     graf2(gen)=max(Fit);
     best2=selbest(pop,-Fit,[2,1,1]);
     newpop=seltourn(pop,-Fit,popsize - 4);  
     %newpop=crossov(newpop,1,0);
     newpop=mutx(newpop,0.4,[0*ones(1,5); 10000000*ones(1,5)]);
     newpop=muta(newpop,0.7,100000*[1 1 1 1 1],[0*ones(1,5); 10000000*ones(1,5)]);
     newpop=muta(newpop,0.9,1000*[1 1 1 1 1],[0*ones(1,5); 10000000*ones(1,5)]);
     pop=[best2; newpop]; 
end
M = ['miera->',num2str(max(Fit))];
disp(M);
pop=genrpop(popsize,[0*ones(1,5); 10000000*ones(1,5)]);
for gen=1:gensize
     Fit=mrtvapokuta(pop);
     graf3(gen)=max(Fit);
     best3=selbest(pop,-Fit,[2,1,1]);
     newpop=seltourn(pop,-Fit,popsize - 4);  
     %newpop=crossov(newpop,1,0);
     newpop=mutx(newpop,0.2,[0*ones(1,5); 10000000*ones(1,5)]);
     newpop=muta(newpop,0.7,100000*[1 1 1 1 1],[0*ones(1,5); 10000000*ones(1,5)]);
     newpop=muta(newpop,0.9,1000*[1 1 1 1 1],[0*ones(1,5); 10000000*ones(1,5)]);
     pop=[best3; newpop]; 
end
D = ['mrtva->',num2str(max(Fit))];
disp(D);
close all
figure;
                                %zakomentuj az sem pre 1 graf
hold on;
xlabel('generacia');
ylabel('fitness');
plot(graf1,'r');%stup
plot(graf2,'b');%miera        %zakomentuj pre 
plot(graf3,'g');%mrtva        %1 graf






function result = stupokuta(pop)    
for i=1:size(pop)
    profit=(pop(i,1)*0.04+pop(i,2)*0.07+pop(i,3)*0.11+pop(i,4)*0.06+pop(i,5)*0.05);
    
    trest =0;
    if((pop(i,1)+pop(i,2)+pop(i,3)+pop(i,4)+pop(i,5))>10000000)
        trest=trest + 1;        
    end
    if((pop(i,1)+pop(i,2))>2500000)
        trest=trest + 1;        
    end
    if((-pop(i,4)+pop(i,5))>0)
        trest=trest + 1;        
    end
    if((-0.5*pop(i,1)-0.5*pop(i,2)+0.5*pop(i,3)+0.5*pop(i,4)-0.5*pop(i,5))>0)
        trest=trest + 1;        
    end    
    profit=profit-10000000*trest;   
    result(i) = profit; 
end
end

function result = mrtvapokuta(pop)    
for i=1:size(pop)
    profit=(pop(i,1)*0.04+pop(i,2)*0.07+pop(i,3)*0.11+pop(i,4)*0.06+pop(i,5)*0.05);    
    
    if((pop(i,1)+pop(i,2)+pop(i,3)+pop(i,4)+pop(i,5))>10000000)
        profit= -10000000; end
    if((pop(i,1)+pop(i,2))>2500000)
        profit= -10000000; end
    if((-pop(i,4)+pop(i,5))>0)
        profit= -10000000; end
    if((-0.5*pop(i,1)-0.5*pop(i,2)+0.5*pop(i,3)+0.5*pop(i,4)-0.5*pop(i,5))>0)
        profit= -10000000; end   
   result(i) = profit; 
end
end

function result = mierapokuta(pop)    
for i=1:size(pop)
    profit=(pop(i,1)*0.04+pop(i,2)*0.07+pop(i,3)*0.11+pop(i,4)*0.06+pop(i,5)*0.05);
    
    
    if((pop(i,1)+pop(i,2)+pop(i,3)+pop(i,4)+pop(i,5))>10000000)
        profit= profit -((pop(i,1)+pop(i,2)+pop(i,3)+pop(i,4)+pop(i,5))-10000000); end
    if((pop(i,1)+pop(i,2))>2500000)
        profit= profit -((pop(i,1)+pop(i,2))-2500000); end
    if((-pop(i,4)+pop(i,5))>0)
        profit= profit -(-pop(i,4)+pop(i,5)); end
    if((-0.5*pop(i,1)-0.5*pop(i,2)+0.5*pop(i,3)+0.5*pop(i,4)-0.5*pop(i,5))>0)
        profit= profit -(-0.5*pop(i,1)-0.5*pop(i,2)+0.5*pop(i,3)+0.5*pop(i,4)-0.5*pop(i,5)); end     
   result(i) = profit; 
end
end
