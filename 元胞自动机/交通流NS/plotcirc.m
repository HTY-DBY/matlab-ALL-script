function h=plotcirc(L,x,dt,h)
W = 0.05;R=1;
ncar = length(x);

theta = 0:2*pi/L:2*pi;
xc = cos(theta);yc = sin(theta);
xin = (R-W/2)*xc;yin = (R-W/2)*yc;
xot = (R+W/2)*xc;yot = (R+W/2)*yc;

xi = [xin(x);xin(x+1);xot(x+1);xot(x)];
yi = [yin(x);yin(x+1);yot(x+1);yot(x)];

if nargin == 3
    color = randperm(ncar);
    h = fill(xi,yi,color);hold on
    plot([xin;xot],[yin;yot],'k','linewidth',1.5);
    plot([xin;xot]',[yin;yot]','k','linewidth',1.5);
else
    for i=1:ncar
        set(h(i),'xdata',xi(:,i),'ydata',yi(:,i));
    end
end
pause(dt)