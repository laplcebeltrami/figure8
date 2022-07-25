function coord = graph_arc(center,radius, arc, n, sigma)
%function coord = graph_arc(center,radius, arc, n, sigma)
%
% Draw scattter point along a circle at center with given radius with noise
% N(0, sigma^2) but with an arc missing. The circle is drawn between arc(1)
% and arc(2). 
%
% INPUT
%     center: Center of circle
%     raidus: radius of circle
%     arc   : It is given as arc = [arc(1) arc(2)]. The circle will be drawn 
%             betweeen arc(1) and arc(2) where angles should be in [0 2\pi] range
%     n     : n points we are sampling
%     sigma : noise variance N(0,sigma^2) of scatter points
%
% OUTPUT
%     coord: the coordinates of n sampled points. 
%
%
% The simulation model is first introduced in 
% Chung, M.K., Huang, S.-G., Carroll, I.C., Calhoun, V.D., Goldsmith, H.H. 
% 2022 Wasserstein graph clustering in determining the genetic contribution 
% of state changes in rs-fMRI, Annual Meeting of the Organization for Human Brain Mapping (OHBM)
% https://pages.stat.wisc.edu/~mchung/papers/HBM2022/chung.2022.OHBM.pdf
%
% (C) 2022 Moo K. Chung
%  University of Wisconsin-Madison
%
%
% The code is downloaded from https://github.com/laplcebeltrami/figure8


theta = linspace(arc(1),arc(2),n); %sample n points along circle

x=radius*(cos(theta)+center(1));
y=radius*(sin(theta)+center(2));
coord=[x ; y]'; %2 x n matrix

coord=coord + normrnd(0,sigma,n,2);