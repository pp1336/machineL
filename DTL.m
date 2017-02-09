function [tree] = DTL(examples, attributes, binary_targets)

% examples mxn matrix, attributes 1xn row vec, binary_targets mx1 col vec
% attributes must be integer index of actual attributes

[m, n] = size(examples);
l = sum(binary_targets);

if l == 0 || l == m
    % return leaf node with this value
    tree.op = [];
    tree.kids = [];
    tree.class = binary_targets(1);
    return;
elseif isempty(attributes)
    % return leaf node with value = MAJORITY-VALUE(binary_targets)
    tree.op = [];
    tree.kids = [];
    tree.class = mode(binary_targets);
    return;
else 
    [best_attribute, index] = BestAttribute(examples, attributes, binary_targets); 
    tree.op = best_attribute;
    tree.kids = cell(1, 2);
    tree.class = [];
    
    new_attributes = attributes;
    new_attributes(index) = [];
    
    attr_range = [1:n];
    attr_range(index) = [];
    
    for i = 0:1
        % add subtree
        row_idx = (examples(:, index) == i);
        new_examples = examples(row_idx, attr_range);
        new_binary_targets = binary_targets(row_idx, 1);
        if isempty(new_examples)
            % return a leaf node with value = MAJORITY-VALUE(binary_targets)
            child.op = [];
            child.kids = [];
            if l == (m / 2)
                child.class = i;
            else
                child.class = mode(binary_targets);
            end
            % set the subtree
            tree.kids{1, i + 1} = child;
        else
            child = DTL(new_examples, new_attributes, new_binary_targets);
            tree.kids{1, i + 1} = child;
        end
    end
              
                  
end
