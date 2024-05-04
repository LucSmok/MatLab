
function x = SolveLinearSystem(LU, B)
    n = length(LU);
    y = zeros(size(B));
    % find solution of Ly = B
    for i = 1:n
        y(i,:) = B(i,:) - LU(i,1:i)*y(1:i,:);
    end
    % find solution of Ux = y
    x = zeros(size(B));
    for i = n:(-1):1
        x(i,:) = (y(i,:) - LU(i,(i + 1):n)*x((i + 1):n,:))/LU(i, i);
    end    
end