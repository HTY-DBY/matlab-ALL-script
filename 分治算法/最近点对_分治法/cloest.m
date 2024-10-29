%分治求最近点对
function [d,x1,x2] = cloest(S,low,high)
P=[];
if(high - low == 1)
    [d,x1,x2] = deal(pdist2(S(low,:),S(high,:)),S(low,:),S(high,:));
elseif(high - low == 2)
    d1 = pdist2(S(low,:),S(low + 1,:));
    d2 = pdist2(S(low + 1,:),S(high,:));
    d3 = pdist2(S(low,:),S(high,:));
    if((d1 < d2) && (d1 < d3))
        [d,x1,x2] = deal(d1,S(low,:),S(low + 1,:));
    elseif(d2 < d3)
        [d,x1,x2] = deal(d2,S(low+1,:),S(high,:));
    else
        [d,x1,x2] = deal(d3,S(low,:),S(high,:));
    end
else
    mid = floor((low+high)/2);
    [d1,x11,x12] = cloest(S,low,mid);
    [d2,x21,x22] = cloest(S,mid+1,high);
    if(d1 <= d2)
        [d,x1,x2] = deal(d1,x11,x12);
    else
        [d,x1,x2] = deal(d2,x21,x22);
    end
    index = 0;
    for i = mid:-1:low
        if(S(mid,1) - S(i,1) >= d)
            break;
        end
        index = index + 1;
        P(index,:) = S(i,:);
        
    end
    for i = mid+1:high
        if(S(i,1) - S(mid,1) >= d)
            break;
        end
        index = index + 1;
        P(index,:) = S(i,:);
        
    end
    sortrows(P,2);
    for i = 1:index
        for j = i+1:index
            if(P(j,2) - P(i,2) >= d)
                break;
            else
                d3 = pdist2(P(i,:),P(j,:));
                if(d3 < d)
                    [d,x1,x2] = deal(d3,P(i,:),P(j,:));
                end
            end
        end
    end
end