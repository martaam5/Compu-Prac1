function Ff = AssemblyFf(COOR,CN,b,f,he)

    % Size define 
    nelem = size(CN,1);
    nnode = size(COOR,1); 
    nnodeE = size(CN,2);
    
    % Force matrix 
    Ff = zeros(nnode,1);
    Ff(nnode) = b;
    
    for e = 1:nelem
        % Element force 
        Fe = COMPUTE_Fe_Force(CN,e,f,he,COOR);
        for a = 1:nnodeE
            A = CN(e,a);
            Ff(A) = Ff(A) + Fe(a);
        end
    end



end