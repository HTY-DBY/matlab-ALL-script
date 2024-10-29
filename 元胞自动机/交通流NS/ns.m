function [flux,vmean] = ns(rho,p,L,tmax)

ncar = ceil(L*rho);
vmax = 5;
x = sort(randperm(L,ncar));
v = vmax*ones(1,ncar);
flux = 0;vmean = 0;

h = plotcirc(L,x,0.5);

for t = 1:tmax
    v = min(v+1,vmax);
    
    gaps = gaplength(x,L);
    v = min(v,gaps - 1);
    
    vdrops = (rand(1,ncar)<p);
    v = max(v - vdrops,0);
    
    x = x + v;
    
    passed = x>L;
    x(passed) = x(passed)-L;
    
    if t>tmax/2
        flux = flux +sum(v)/L;
        vmean = vmean+mean(v);
    end
    plotcirc(L,x,0.5,h);
end

flux = flux/(tmax/2);
vmean = vmean/(tmax/2);