clear;
defpops = [-500 -500 -500 -500 -500 -500 -500 -500 -500 -500
            500 500 500 500 500 500 500 500 500 500 ];
populazion = 100;
generazion = 300;

oldpops = genrpop(populazion,defpops);
vyber = [populazion*0.1 populazion*0.01 populazion*0.01];
vybersize = 70;
    figure, hold on;
    xlabel('generation');
    ylabel('fitness');
    grid

    bestnew = selbest(oldpops,testfn3(oldpops),1);
    finale = [testfn3(bestnew)];
    for i = 1:generazion
    end
    icka(generazion+1) = generazion+1;
    %plot(i,testfn3(oldpops),'r.',markersize=5);
    %bestold = selbest(oldpops,testfn3(oldpops),1);
for i = 1:generazion
    icka(i)=i;
    bestnew = selbest(oldpops,testfn3(oldpops),1);
    finale = [finale testfn3(bestnew)];
    %plot(i,testfn3(bestnew),'-r.',markersize=5);
    newpops=selbest(oldpops,testfn3(oldpops),vyber);
    randpops=selrand(oldpops,testfn3(oldpops),populazion-vybersize);
    newpops = vertcat(newpops,randpops);
    newpops=crossov(newpops,1,1);
    newpops=mutx(newpops,0.5,defpops);
    oldpops = newpops;
    %bestold = bestnew;
end 
final = selbest(newpops,testfn3(newpops),1)
plot(icka,finale,'.-r');