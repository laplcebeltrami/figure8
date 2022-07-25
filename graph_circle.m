function coord = graph_circle(center,radius, n, sigma)
%function coord = graph_circle(center,radius, n, sigma)
% Draw scattter point along a circle at center with given radius with noise N(0, sigma^2).
%
% INPUT
%     center: Center of circle
%     raidus: radius of circle
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



theta = linspace(0,2*pi,n); %sample n points along circle

x=radius*(cos(theta)+center(1));
y=radius*(sin(theta)+center(2));
coord=[x ; y]'; %2 x n matrix

coord=coord + normrnd(0,sigma,n,2);