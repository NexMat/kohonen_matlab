%
% Script
%

% Base de patterns Partie 1 et Partie 2.1
% data = [] ;
% data.dim_input = 2 ;
% data.n_pattern = 1000 ;


% DataPattern Partie 1
% data.pattern = rand(data.n_pattern,data.dim_input)/2 + 0.25;

% DataPattern Partie 2.1
% Question 8
% r = 0.5 * rand(data.n_pattern,1);
% angle = 2*pi*rand(data.n_pattern,1);
% a = cos(angle);
% b = sin(angle);
% data.pattern = [0.5+r.*a 0.5+r.*b];

% Question 13 (http://mathworld.wolfram.com/DiskPointPicking.html pour voir
% la difference entre les deux distributions)
% R = 0.5 * sqrt(rand(data.n_pattern,1));
% angle = 2*pi*rand(data.n_pattern,1);
% data.pattern = [0.5+R.*cos(angle) 0.5+R.*sin(angle)];

% Base de patterns Partie 2.2
% data = read_input('C:\Users\Corentin\Documents\TP_Kohonen\data\set_xor.txt');

% Base de patterns Partie 2.3
data = read_input('C:\Users\Corentin\Documents\TP_Kohonen\data\digit10_16x16_learn.txt');
% data_2 = read_input('C:\Users\Corentin\Documents\TP_Kohonen\data\digit10_16x16_test.txt');

% Creation d'une carte de Kohonen
N                   = 10 ;
learning_rate       = [0.5 0.1] ;       % Initial et final
neighborhood_spread = [3.0e0 1.0e-1] ;  % Initial et final (distance du voisin)
size_pattern        = data.dim_input ;
map = SOM_Create1D (N , learning_rate , neighborhood_spread , size_pattern) ;


% Nettoyage de l'affichage
clf ;

% Initialisation du premier affichage
% hold on ;
% SOM_PlotPatterns(data.pattern) ;
% h = SOM_PlotNodes(map) ;
% title('T = 0.  Cliquer pour commencer ...')
% waitforbuttonpress ;
% figure(1) ;

% Affichage de la base de chiffres manuscrits
disp = SOM_BuildImageFromData(data);
figure();
imshow(disp);
title('learn');
% figure()
% disp2 = SOM_BuildImageFromData(data_2);
% imshow(disp2);
% title('test');

% Lancement de l'apprentissage sur un certain nombre d'iteration
iter_max = 200 ;

% Mise a jour de la carte pour chaque iteration

% tic
% for iter = 1:iter_max
%         
%     % Mise a jour de la carte
%     map = SOM_OneStepLearning (map , data , iter , iter_max) ;
%     
%     % Affichage des poids des neurones  
%     if iter <= iter_max
%         delete(h) ;
%     end
%     h = SOM_PlotNodes(map) ;
%     title(sprintf('T = %d', iter)) ;
%     drawnow ;
% end
% toc


