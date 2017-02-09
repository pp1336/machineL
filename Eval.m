function[class] = Eval(tree, example)

% tree is a decision tree  example is a row vec

if isempty(tree.kids)
    class = tree.class;
else
    if example(1, tree.op) == 0
        class = Eval(tree.kids{1,1}, example);
    else
        class = Eval(tree.kids{1,2}, example);
    end
end

end