function Fe = COMPUTE_Fe_Force(CN,e,f,he,COOR)
    
    syms x
    % Coord physical domain
    COORe = COOR(CN(e,:),1);
    
    % Order of the Polynomial f = sx^2
    p = 2; % optimizar!!
    
    % Weights and Positions in phisical Domain
    [w,xi,m] = Weights_Positions(p);
    
    % Compute Force vector 
    Fe = 0;                                 % Initial Value 
    for a = 1:m 
        Ne = 1/2 * [(1-xi(a)), (1+xi(a))];  % Basis Function of each element
        xe = Ne*COORe;                      % Position od each Gauss Point in the phisical domain
        fe = -subs(f,x,xe);                 % Value of the function f at each Gauss Point
        q = Ne.'*fe;                       % q = NeT*f
        Fe = Fe + he(e)/2*w(a)*q;           % Desired Force Vector 
    end
    
    
end



