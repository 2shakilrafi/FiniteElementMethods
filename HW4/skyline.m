[pointers,values] = skylineformat(A)

m = size(A,1);
pointers = NaN(m+1);
values = [];

for i=1:m
    pointers(i) = len(values)+1;
    start_point = find(A(i,:),1);
    end_point = i;
    values = [values, A(i,start_point:end_point)] 
end

