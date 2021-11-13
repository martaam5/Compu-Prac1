function WF = VariationalWeakForm(rho,L,x,f,symparameters,parameters)

  %% Input Data
    % Unknown functions u(x) v(x)
       syms u(x) v(x) 
       
    % Second Derivate
       DDu = diff(u,x,2);   

  %% Formulation of teh variational (or Weak Form) of the BVP
       WF.sym = vpa(int(v(x)*(DDu + rho*u(x) - f),x,[0 L]),4);  % Symbolic
       WF.num = vpa(subs(WF.sym,symparameters,parameters),4);   % Numeric

end

