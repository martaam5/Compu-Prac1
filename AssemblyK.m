function K = AssemblyK(COOR,CN,rho,he)
     
    % Size define 
    nelem = size(CN,1);
    nnode = size(COOR,1); 
    nnodeE = size(CN,2);
    
    % Stiffness Matrix 
    K = zeros(nnode, nnode);
    
    % Compute Global Stiffness Matrix
    for e = 1:nelem
        
        % Elemental matrix
        Ke = 1/he(e,1) * [1 -1 ; -1 1] - rho * (he(e,1)/6) * [2 1 ; 1 2];
        
        % Assembly
        for a = 1:nnodeE
            A = CN(e,a);
            for b = 1:nnodeE
                B = CN(e,b);
                K(A,B) = K(A,B) + Ke(a,b);
            end
        end
    end
end




