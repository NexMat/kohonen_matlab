function img = SOM_BuildImageFromDataThroughMap(map,data)

% Nombre de patterns par ligne (1 ligne = 1 classe)
Ncol = data.n_pattern / data.n_class ;

% Nombe de patterns par colonne
Nlig = data.n_class ;

% Dimension d'une imagette (pw x pw)
pw = sqrt(data.dim_input) ;

%
%   Production de l'image retournée
%

% Allocation de l'image à remplir avec les imagettes
img = zeros (Nlig*pw , Ncol*pw) ;
    
% Collages des imagettes de chaque chiffre
%   1 pattern (256) est alors représenté par une imagette 16x16
for p = 1:data.n_pattern
    
    % Chercher le neurone le plus proche de l'imagette
    [d n] = SOM_NearestNode(data.pattern(p,:),map);
    
    % Construction de l'imagette du neurone gagnant
    img_win = reshape(map.weights(n,:),pw,pw);
    
    % Position de l'imagette dans l'image finale
    ol = floor((p-1)/Ncol)*pw+1 ;
    oc = (rem(p-1,Ncol))*pw+1 ;
    
    % Recpie de l'imagette dans l'image finale
    img(ol:ol+pw-1 , oc:oc+pw-1) = img_win(:,:)' ;

end
