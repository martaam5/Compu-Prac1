function d = Compute_d(K,Ff,g,nnode)
       
      % Coeffcients
      r = 1;                            % First coefficient of the c Matrix (known) 
      l = 2:nnode;                      % Number of coeffcients as of the second (unknowns)   
        
      % Unknown nodal displecements 
      d_(r) = -g;
      d_(l) = vpa(K(l,l)\(Ff(l)-K(l,r)*d_(r)),4);  
        
      % Solution d matrix
      d = mat2cell(d_,1); 
end

