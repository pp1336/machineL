function [ig] = Ig(examples, binary_targets, total_entropy, index, num_rows)

    p0 = 0;
    n0 = 0;
    p1 = 0;
    n1 = 0;

    for i = 1 : num_rows
        
        if (examples(i, index) == 1)
        % p1 n1
            if (binary_targets(i) == 1)
                p1 = p1 + 1;
            else
                n1 = n1 + 1;
            end
        
        else
        % p0 n0
            if (binary_targets(i) == 1)
                p0 = p0 + 1;
            else
                n0 = n0 + 1;
            end
           
        end
    end
    
    neg = Entropy(p0, n0);
    pos = Entropy(p1, n1);

    ig = total_entropy - ((p0 + n0) / num_rows) * neg - ((p1 + n1) / num_rows) * pos;
end