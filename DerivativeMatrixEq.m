function WF_DME = DerivativeMatrixEq(WF,x,symparameters,parameters)

    % Define symbolic Variables
    syms N(x) d c w_(x) u_(x) u(x) v(x) 
    
    % Define new variables
    u_(x) = N(x)*d; 
    v_(x) = N(x)*c; 
    
    % Derivative Matrix Equation 
    WF_DME.sym = vpa(subs(WF.sym,[u,v],[u_(x),v_(x)]),4);           % Symbolic
    WF_DME.num = vpa(subs(WF_DME.sym,symparameters,parameters),4);  % Numeric

end

