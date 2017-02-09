function [entropy] = Entropy(p, n)

    total = p + n;
    if total == 0
        entropy = 0;
        return;
    end
    
    
    p_ratio = p / total;
    n_ratio = n / total;
    
    pos = 0;
    if p_ratio > 0
        pos = -(p_ratio * log2(p_ratio));
    end
    
    neg = 0;
    if n_ratio > 0
        neg = -(n_ratio * log2(n_ratio));
    end
    
    entropy = pos + neg;
    
end