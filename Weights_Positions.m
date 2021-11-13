function [w,xi,m] = Weights_Positions(p)

    % Parent Domain
        % w  = weights
        % xi = position of the Gauss points
        
    % Number of quadrature points 
    m = p+1/2;
    
    % Get Weights and position values according to 'm' 
    if m==1
        w = 2;      
        xi = 0;
    elseif m==2
        w = [1, 1];
        xi = [-1/sqrt(3), 1/sqrt(3)];
    else
        w = [5/9, 8/9, 5/9];
        xi = [sqrt(3/5), 0, -sqrt(3/5)];
    end
    
    
end

