%load('cleandata_students');

new_y = Mapdata(2, y);

[m, n] = size(x);
attr = [1:n];
tree = DTL(x, attr, new_y);

DrawDecisionTree(tree, 'test');

error = 0;

for k = 1:m
    if Eval(tree, x(k, :)) ~= new_y(k, 1)
        error = 1;
    end
end

if error == 1
    disp('error');
else
    disp('no error');
end