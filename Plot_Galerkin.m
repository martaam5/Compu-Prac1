function Plot_Galerkin(vect, x)
    
    % Input Data // Vect = [uexact, g, f, b, rho]
    uexact = vect(1);
    g = vect(2);
    f = vect(3);
    b = vect(4);
    rho = vect(5);
    
    % Basis Polynomial Functions
    N = [ 1, x,     0,      0,      0;          
          1, x,    x^2,     0,      0; 
          1, x,    x^2,    x^3,     0;
          1, x,    x^2,    x^3,    x^4
      ];
    
    for i = 1:length(N)-1
        
        % Basis Functions Aproxximation 
        N_ = N(i,:);
        
        % Displancment by Garlekin Method
        u_Galerkin(i) = GalerkinMethod(N_,f,b,g,rho);
        
        % Plot 
        figure()
        fplot(u_Galerkin(i),[0,1],'b');
        hold on
        fplot(uexact,[0,1],'r-.');
        xlabel ('Longitude, x [m]'); ylabel ('Displacement Field u(x)')
        title ('Galerkin Method'), grid on 
        legend('u_{approx}','u_{exact}','Location','northwest')
        
    end

end

