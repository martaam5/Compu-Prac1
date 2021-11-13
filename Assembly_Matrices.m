function [d,CN,COOR,nnode] = Assembly_Matrices(Nel,vect,nnode)

    for i = 1:length(Nel)
    
        % Define matrices 
        CN = zeros(Nel(i),2);                   % Connectivity Matrix
        COOR = zeros(Nel(i)+1,1);               % Coordinate matrix 
        he = zeros(Nel(i), 1);                  % Distance between nodes 
        nnode = size(COOR,1);
        
        % Diferential x
        dx(i) = 1/Nel(i);
        
        % Fill in matrices
        for e = 1:Nel(i)
            COOR(e+1,1) = e*dx(i);              % Coordinates
            he(e,1) = COOR(e+1,1)-COOR(e,1);    % Distance between nodes
            CN(e,1) = e;    CN(e,2) = e+1;      % Connectivity matrix     
        end
        
        % Assembly K
        K = AssemblyK(COOR,CN,vect(5),he);
        
        % Assembly F
        Ff = AssemblyFf(COOR,CN,vect(4),vect(3),he);
        
        % Compute d
        d(i,1) = Compute_d(K,Ff,vect(2),nnode);        
        
    end
end

