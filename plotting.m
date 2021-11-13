function plotting(vect,parameters,x,uexact)


    %% Exact displacement field (uexact) Ploting 
    figure('name', 'uexact');
    f1 = ezplot(uexact.num, 0, parameters(1));
    title ('Exact Solution of this BVP');
    xlabel('Longitude, x[m]'); ylabel('u [m]'); grid on
    legend(f1, {['Exact: ', char(uexact.num)]})
    
    %% Galerkin aproxximation Plot
    Plot_Galerkin(vect, x)
    
end

