clc
clear all
close all 

        %% ------------------ ASSIGNMENT 1 --------------------  %
        %  ------ Marta Arnabat Martín, Stefania Grozavu ------  %
        %  ----------------- DATE: 04/01/22 -------------------  %
        %  ----------------------------------------------------  %

% T'apunto les coses que vull millorar vida jeje 
 % 1. Treure la funcio f del BVP profeble com f = s*x^2 = (g * pi^4/L^4)x^2
     % (funcio f esta mal) que en el seu moment em vaig equivocar i ho vaig fer de la
     % uexact pero no es correcte, perque no es lo mateix. 
 % 2. El punt 5 esta fet dintre de Plot_Galerkin a la funció Galerkin Method 
     % pero esta tot junt aixi que volia posar totes les solucions per un
     % lloc i els polts a la funció de plotting
 % 3. Optimitzar Assembly_Matrices i treure d'una manera més facil si eso o
     % de organitzar-ho la d, perque despres la necessitarem i es com repetir
     % el mateix proces i no se si fer-ho tot dintre de la mateixa funció. 
 
%% 0. Define Variables
% Unknown function u, as a function of x (position along bar)
syms x u(x)

% Parameters
L = sym('L','real');                    % Length of the bar
E = sym('E','real');                    % Young's Module 
A = sym('A','real');                    % Cross-Section Area

% Boundary Conditions of BVP
g = sym('g','real');                    % Boundary condition in u(0)
b = g*pi^2/L;                           % Boundary condition in u'(1) 

% Constants
rho = pi^2/L^2;                         % Constant
s = g*rho^2;                            % Constant
 
% Functions 
q = E*(rho*u(x) - s*x^2);               % Force distributed along the bar

%% 1. Boundary Value Problem (BVP)
% Derivatives
Du = diff(u,x); DDu = diff(Du); 

% Strong Form of the BVP
BVP = vpa(DDu + q/E,4);           

%% 2. Exact Solution of this BVP and Plotting
% Define Values 
L_v = 1;                                % Long [m]
g_v = 0.01;                             % Displacement u(0)[m]

% Convert sym to mat 
symparameters = [L g];                  % Symbolic parameters           
parameters = [L_v g_v];                 % Numerical data

% Exact Displacement field (uexact)
[uexact, vect, f] = uexact(u,Du,BVP,g,L,b,rho,x,symparameters,parameters);

%% 3. Weak form of BVP
WF = VariationalWeakForm(rho,L,x,f,symparameters,parameters);

%% 4. Derivate of matrix equation 
WF_DME = DerivativeMatrixEq(WF,x,symparameters,parameters);

%% 5. Approximate Solution (Galerkin Method) 

%% 6. Solving Weak Form with linear FE
% Number of elements 
Nel = [5;10;20;40];            

% Nodal displecements
[d,CN,COOR,nnode] = Assembly_Matrices(Nel,vect);

%% 9. Plotting
plotting(vect,parameters,x,uexact)