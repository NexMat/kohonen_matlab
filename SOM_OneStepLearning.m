function map = SOM_OneStepLearning (map , data , iter , iter_max)
% SOM_OneStepLearning : R�alise une it�ration de l'apprentissage d'une
% carte de Kohonen.
% Les poids sont mis � jour directement dans la structure map
% [IN]
%   map      : Structure contenant la carte de Kohonen
%   data     : Structure contenant les donn�es
%   iter     : Num�ro de l'it�ration courante
%   iter_max : Nombre maximum d'it�ration
% [OUT]
%   Les poids de la carte sont mis � jour dans la structure map
    l = floor(size(data.pattern,1)*rand);
    patt_in = data.pattern(l+1,:);
    [d inode] = SOM_NearestNode (patt_in, map);
    map = SOM_UpdateWeights (map , patt_in , inode , iter , iter_max);
end

