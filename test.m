load('cleandata_students');

%Change this emotion_no to fit the emotion type
emotion_no = 6;
%End of change

error = zeros(10, 1);
temp_tree = [];
chosen_tree = [];
for i = 1:10
    mid_num = i*100;
    if i ~= 10
        fold_y = [y(1:mid_num); y((mid_num+101):1004)];
        fold_x = [x(1:mid_num, :); x((mid_num+101):1004, :)];
        fold_vx = x((mid_num+1):(mid_num+100), :);
    else
        fold_y = y(101:1004);
        fold_x = x(101:1004, :);
        fold_vx = x(1:100, :);
    end
    
    new_y = Mapdata(emotion_no, fold_y);

    [m, n] = size(fold_x);
    attr = [1:n];
    temp_tree = [temp_tree DTL(fold_x, attr, new_y)];
    

    %tree_name = string('tree ') + i;
    %DrawDecisionTree(tree, tree_name);
    
    
    for k = 1:100
        if Eval(temp_tree(i), fold_vx(k, :)) ~= new_y(k,1)
            error(i) = error(i) + 1;
        end
    end
    
    disp(error(i));
end

[min_error, best_fold_no] = min(error);
chosen_tree = [chosen_tree temp_tree(best_fold_no)];

tree_name = string('tree ') + best_fold_no + ' for emotion ' + emotion_no;
DrawDecisionTree(chosen_tree(1), tree_name);
