function u = GalerkinMethod(N,f,b,g,rho) 

%% INPUT DATA
    syms x
 % First Polynomial function N1(x)   
    N1 = subs(N,1);
 % Derivative of N(x) 
    B = diff(N);          
 % K integral term  
    K = int(B.'*B-N.'*N*rho,x,0,1);
 % F integral term
    F = -int((N.'*f),x,0,1)+N1.'*b; 
    
%% RESULT
 % Coeffcients
    r = 1;                          % First coefficient of the c Matrix (known unknowns) 
    l = 2:length(N) ;               % Number of coeffcients as of the second (unknowns)   
 % Coefficients solution 
    dl = K(l,l)\(F(l)+K(l,r)*g);    % Solving system   
 % Solution u(x)
    u = N(l)*dl-g; 
 
 
  






end
