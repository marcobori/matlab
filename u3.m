clc , clear;
popsize = 200;
pop=genrpop(popsize,[0*ones(1,5); 2500000*ones(1,5)]);

for gen=1:1000
     Fit=stupokuta(pop);
     Fit=mierpokuta(pop);
     Fit=mrtpokuta(pop);
     graf(gen)=max(Fit);
     naj=selbest(pop,-Fit,[2,1,1]);
     work=seltourn(pop,-Fit,popsize - 4);  
     work=crossov(work,1,0);
     work=mutx(work,0.4,[0*ones(1,5); 2500000*ones(1,5)]);
     work=muta(work,0.4,100000*[1 1 1 1 1],[0*ones(1,5); 2500000*ones(1,5)]);
     pop=[naj; work]; 

end

hold on;
plot(graf);

function vysledok = stupokuta(pop)
    
for i=1:size(pop)
    zisk=(pop(i,1)*0.04+pop(i,2)*0.07+pop(i,3)*0.11+pop(i,4)*0.06+pop(i,5)*0.05);
    
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
    
       zisk=zisk-100000*trest;
    

   vysledok(i) = zisk; 
end
end

function vysledok = mrtpokuta(pop)
    
for i=1:size(pop)
    zisk=(pop(i,1)*0.04+pop(i,2)*0.07+pop(i,3)*0.11+pop(i,4)*0.06+pop(i,5)*0.05);
    
    
    if((pop(i,1)+pop(i,2)+pop(i,3)+pop(i,4)+pop(i,5))>10000000)
        zisk= -1000000; end


    if((pop(i,1)+pop(i,2))>2500000)
        zisk= -1000000; end

    if((-pop(i,4)+pop(i,5))>0)
        zisk= -1000000; end

    if((-0.5*pop(i,1)-0.5*pop(i,2)+0.5*pop(i,3)+0.5*pop(i,4)-0.5*pop(i,5))>0)
        zisk= -1000000; end
        

   vysledok(i) = zisk; 
end
end


function vysledok = mierpokuta(pop)
    
for i=1:size(pop)
    zisk=(pop(i,1)*0.04+pop(i,2)*0.07+pop(i,3)*0.11+pop(i,4)*0.06+pop(i,5)*0.05);
    
    
    if((pop(i,1)+pop(i,2)+pop(i,3)+pop(i,4)+pop(i,5))>10000000)
        zisk= zisk -((pop(i,1)+pop(i,2)+pop(i,3)+pop(i,4)+pop(i,5))-10000000); end


    if((pop(i,1)+pop(i,2))>2500000)
        zisk= zisk -((pop(i,1)+pop(i,2))-2500000); end

    if((-pop(i,4)+pop(i,5))>0)
        zisk= zisk -(-pop(i,4)+pop(i,5)); end

    if((-0.5*pop(i,1)-0.5*pop(i,2)+0.5*pop(i,3)+0.5*pop(i,4)-0.5*pop(i,5))>0)
        zisk= zisk -(-0.5*pop(i,1)-0.5*pop(i,2)+0.5*pop(i,3)+0.5*pop(i,4)-0.5*pop(i,5)); end
        

   vysledok(i) = zisk; 
end
end
