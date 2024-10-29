%解码
function result=jieMa(gene , range)
     global L
     a=range(1) ;
     b=range(2) ;
    dco=zeros(L,1);
    for i=1 : L
        dco(i)=10^(L-i); %解码器
    end
    result=gene * dco / (dco(1)-1)/10 *(b-a)+a;
    
end
