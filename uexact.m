function [uexact, vect, f] = uexact(u,Du,BVP,g,L,b,rho,x,symparameters,parameters)
 
    % Exact Solution 
    uexact.sym = vpa(dsolve(BVP  == 0, u(0) == -g, Du(L) == b),4);
     
    % Function f
    f = (97.41*g*x^2)/L^4;
    
    % Subs of [L, g] in [uexact, g, f, b, rho]
    vect = vpa(subs([uexact.sym, g, f, b, rho],symparameters,parameters),4);
    
    % Displacement field (uexact)
    uexact.num = vpa(vect(1),4); 
    
end

