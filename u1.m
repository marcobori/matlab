clear;
defpops = [-500 -500 -500 -500 -500 -500 -500 -500 -500 -500
            500 500 500 500 500 500 500 500 500 500 ];
populazion = 100;
generazion = 500;

oldpops = genrpop(populazion,defpops);
vyber = [populazion*0.10 populazion*0.03 populazion*0.01];
vybersize = populazion-vyber;
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

    newpops=seltourn(oldpops,testfn3(oldpops),vybersize);
    randpops=selbest(oldpops,testfn3(oldpops),vyber);
    newpops=crossov(newpops,1,0);
    newpops = vertcat(newpops,randpops);
    newpops=mutx(newpops,0.1,defpops);
    newpops=muta(newpops,0.1,0.05*[1 1 1 1 1 1 1 1 1 1],defpops);    
    oldpops = newpops;
    %bestold = bestnew;
end 
final = selbest(newpops,testfn3(newpops),1)
disp(testfn3(final));
plot(icka,finale,'.-r');