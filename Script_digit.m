%
%   Script : Base de chiffres
%

% Lecture de la base de patterns
data = read_input('C:\Users\Corentin\Documents\TP_Kohonen\data\digit4_16x16_learn.txt');

% Taille d'une imagette carrée
pw   = int16(sqrt(data.dim_input)) ;


% Création d'une carte de Kohonen
N                   = 10 
learning_rate       = [0.5 0.1] ;       % Initial et final
neighborhood_spread = [10.0e0 1.0e-1] ;  % Initial et final 3 0.1
size_pattern        = data.dim_input 
map = SOM_Create2D (N , learning_rate , neighborhood_spread , size_pattern) ;


% Nettoyage de l'affichage
clf ;

% Lancement de l'apprentissage sur un certain nombre d'itération
iter_max = 2000 ;

% Mise à jour de la carte pour chaque itération
for iter = 1:iter_max
    
    % Mise à jour de la carte
    map = SOM_OneStepLearning (map , data , iter , iter_max) ;
    
    % Construction de l'image des poids des neurones  
    img = SOM_BuildImageFromMap (map) ;
    
    % Affichage de l'image des poids
    imagesc (img) ;
    title(sprintf('T = %d', iter))
    drawnow ;
end
pause
% Phase de test
data2 = read_input('C:\Users\Corentin\Documents\TP_Kohonen\data\digit4_16x16_test.txt');
img_test = SOM_BuildImageFromDataThroughMap(map,data2);
img_base = SOM_BuildImageFromData(data2);
figure
subplot(1,2,1)
imshow(img_test)
title('test')
subplot(1,2,2)
imshow(img_base)
title('originale')

