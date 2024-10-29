function a=QuickSort(a,leftIndex,rightIndex)
% a是待排序序列
%leftIndex和rightIndex是开始的左右两个边界
%%----------------------------------------------------------%%
% if leftIndex>rightIndex
%     break;
% end
if leftIndex<rightIndex
    i=leftIndex;
    j=rightIndex;
    temp=a(i);%选定的这个数挖掉，相当于挖坑
    while i<j
        while (i<j)&&(a(j)>=temp)%从右往左，找到第一个小于设定的数，
            j=j-1;
        end
        a(i)=a(j);%将找到的第一个小于设定的数填坑到最开始挖的坑里面去
        while (i<j)&&(a(i)<=temp)%从做到由，找到第一个大于选定的数
            i=i+1;
        end
        a(j)=a(i);%将找到的第一个大于选定的数填入上一步挖的坑里面去
%     if i==j
%         a(j)=temp;
%     end
    end
    a(j)=temp;%最后，i=j，将选定的数再填到上一步挖的坑里面去
    a=QuickSort(a,leftIndex,j-1);%对左边序列进行递归
    a=QuickSort(a,i+1,rightIndex);%对右边序列进行递归
end
end