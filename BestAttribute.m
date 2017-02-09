function [best_attribute, index] = BestAttribute(examples, attributes, binary_targets)

    max_ig = -1;
    index = -1;
    
    [num_rows, num_cols] = size(examples);
    p = sum(binary_targets);
    n = num_rows - p;
    total_entropy = Entropy(p, n);

    for i = 1 : num_cols
        ig = Ig(examples, binary_targets, total_entropy, i, num_rows);
        if (ig > max_ig)
            max_ig = ig;
            index = i;
        end
    end
    
    best_attribute = attributes(1, index);

end



