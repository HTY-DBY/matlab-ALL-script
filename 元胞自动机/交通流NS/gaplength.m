function gaps = gaplength(x,L)
ncar = length(x);
gaps = inf*ones(1,ncar);
if ncar>1
    gaps = x([2:end 1]) -x;
    gaps(gaps<0) = gaps(gaps<0) +L;
end