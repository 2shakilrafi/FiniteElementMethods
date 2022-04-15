function [pointers,values] = skylinestorage(A)

m = size(A,1);
pointers = NaN(1, m+1);
values = [];

for i=1:m
    pointers(i) = size(values,2)+1;
    start_point = find(A(i,:),1);
    end_point = i;
    values = [values, A(i,start_point:end_point)]; 
end

end