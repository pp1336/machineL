function[y] = Mapdata(num, y)

[n, ~] = size(y);
for i = 1:n
    if y(i, 1) == num
        y(i, 1) = 1;
    else
        y(i, 1) = 0;
    end
end

end