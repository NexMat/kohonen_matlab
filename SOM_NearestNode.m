function [dm  n] = SOM_NearestNode (patt , map)
% SOM_Distance : Calcule les distances entre le pattern et les diff�rents
% noeuds de la carte (dans l'espace des patterns)
% [IN]
%   patt : pattern d'entr�e
%   map  : carte de Kohonen dans laquelle on recherche le neurone le
%          plus proche
% [OUT]
%   d    : distance entre le pattern et tous les neurones
%   n    : index du neurone le plus proche

% Dupliquer le pattern n_nodes fois

rpatt = repmat(patt, map.n_nodes, 1);
% patt_array = ones(map.n_nodes,1)*patt;

d = sum((rpatt - map.weights).^2,2);
% d = sum((patt_array - map.weights).^2,2);

% dm renvoie la distance minimale et n renvoie l'index correspondant
[dm n] = min(d); 

end



