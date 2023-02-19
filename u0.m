x = -6:0.1:6;
y = 0.2*x.^4+0.2*x.^3-4*x.^2+10;
plot(x,y);

xp = 0;

xkrok = 0.5;
yp = funkcia1D(xp);
while 1
xs1 = xp - xkrok;
xs2 = xp + xkrok;
yp = funkcia1D(xp);
ys1 = funkcia1D(xs1);
ys2 = funkcia1D(xs2);
hold on;
plot(xp,yp,'g.',markersize = 20);
if(ys1 < yp || ys2 < yp)
    if(ys1 < ys2)
        xp = xs1;
    elseif(ys2 < ys1)
        xp = xs2;
    else
        xp = xs1;
    end
else 
    break;
end

end
    hold on;
plot(xp,yp,'r.',markersize = 20);




function [y] = funkcia1D(x)
 y=0.2*x.^4+0.2*x.^3-4*x.^2+10;
end
