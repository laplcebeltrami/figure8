%%  Random network simulation using 2 circles (figure-8 themed)
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

nGroup1 = 5;
nGroup2 = 5;
nGroup3 = 5;
nGroup4 = 5;
g1 = cell(nGroup1, 1);
g2 = cell(nGroup2, 1);
g3 = cell(nGroup3, 1);
g4 = cell(nGroup4, 1);

sigma=0.05;
npoints=200;


%% Topologially different networks
% Simulation should generate random newtorks with topological differnce 
% while there is not much geometric difference. The simulation is degined 
% in such a way to redcude the performandce of Euclidean distance based
% measures. So the traditional k-means clustring will not perform well. 
%Group 1, 2, 3 and 4 will be topologically different

%Group 1: two circles horizontally 
figure; subplot(2,2,1);cla();
coord = graph_arc([-0.5 0],1.5, [0 2*pi], npoints, 0);
hold on; plot(coord(:,1),coord(:,2),'Color',[.7 .7 .7], 'LineWidth',1)';
coord = graph_arc([1 0],1, [0   2*pi], npoints, 0)
plot(coord(:,1),coord(:,2), 'Color',[.7 .7 .7], 'LineWidth',1)';


for i=1:5
    circle1 = graph_arc([-0.5 0],1.5, [0 2*pi], npoints, sigma)
    circle2 = graph_arc([1 0],1, [0 2*pi], npoints, sigma)
    obs =[circle1; circle2];
    hold on; plot(obs(:,1), obs(:,2),'.k');
    coord=[obs(:,1)  obs(:,2)];
    C = pdist(coord);
    C=squareform(C);
    %figure; imagesc(C); colorbar
    g1{i}=C;
end

axis square; box on
figure_bigger(16)
xlim([-3 3]); ylim([-3 3])
title('Group 1')

%--------------
%Group 2: two circles but one circle is missing an arc making Group 2
%topologically differnt than Group 1. However, the missing arc is small
%enough that geometric distances will not able to discriminate Group 1 and
%2. The missing arc can be adjusted for better or worse performance.

subplot(2,2,2);cla()
coord = graph_arc([-0.5 0],1.5, [0 2*pi], npoints, 0)
hold on; plot(coord(:,1),coord(:,2),'Color',[.7 .7 .7], 'LineWidth',1)';

coord = graph_arc([1 0],1, [pi/15   2*pi-pi/15], npoints, 0)
plot(coord(:,1),coord(:,2), 'Color',[.7 .7 .7], 'LineWidth',1)';

for i=1:5
    circle1 = graph_arc([-0.5 0],1.5, [0 2*pi], npoints, sigma);
    circle2 = graph_arc([1 0],1, [pi/15   2*pi-pi/15], npoints, sigma);
    obs =[circle1; circle2];
    hold on; plot(obs(:,1), obs(:,2),'.k');
    coord=[obs(:,1)  obs(:,2)];
    C = pdist(coord);
    C=squareform(C);
    %figure; imagesc(C); colorbar
    g2{i}=C;
end

axis square; box on
figure_bigger(16)
xlim([-3 3]); ylim([-3 3])
title('Group 2')

%--------------
%Group 3: two circles horizontally with 2 missing arcs. Groups 1, 2 and 3
%are topologically different. However, gometric methods will mistkaen all
%of them as similar shapes since the correponding Euclidean will not be too
%different. 

subplot(2,2,3);cla()

coord = graph_arc([-0.5 0],1.5, [pi+pi/20 pi-pi/20+2*pi], npoints, 0)
hold on; plot(coord(:,1),coord(:,2),'Color',[.7 .7 .7], 'LineWidth',1)';

coord = graph_arc([1 0],1, [pi/15   2*pi-pi/15], npoints, 0)
plot(coord(:,1),coord(:,2), 'Color',[.7 .7 .7], 'LineWidth',1)';


for i=1:5
    circle1 = graph_arc([-0.5 0],1.5, [pi+pi/20 pi-pi/20+2*pi], npoints, sigma)
    circle2 = graph_arc([1 0],1, [pi/15   2*pi-pi/15], npoints, sigma)
    obs =[circle1; circle2];
    hold on; plot(obs(:,1), obs(:,2),'.k');
    coord=[obs(:,1)  obs(:,2)];
    C = pdist(coord);
    C=squareform(C);
    %figure; imagesc(C); colorbar
    g3{i}=C;
end

axis square; box on
figure_bigger(16)
xlim([-3 3]); ylim([-3 3])
title('Group 3')

%--------------
%Group 4. Two arcs are missing such that it is topologically equivalent to
%a circle. 

subplot(2,2,4);cla()

coord = graph_arc([-0.5 0],1.5, [pi/20 2*pi-pi/20], npoints, 0)
hold on; plot(coord(:,1),coord(:,2),'Color',[.7 .7 .7], 'LineWidth',1)';

coord = graph_arc([1 0],1, [pi+pi/20   pi-pi/20+ 2*pi], npoints, 0)
plot(coord(:,1),coord(:,2), 'Color',[.7 .7 .7], 'LineWidth',1)';


for i=1:5
    circle1 = graph_arc([-0.5 0],1.5, [pi/20 2*pi-pi/20], npoints, sigma)
    circle2 = graph_arc([1 0],1, [pi+pi/20   pi-pi/20+ 2*pi], npoints, sigma)
    obs =[circle1; circle2];
    hold on; plot(obs(:,1), obs(:,2),'.k');
    coord=[obs(:,1)  obs(:,2)];
    C = pdist(coord);
    C=squareform(C);
    %figure; imagesc(C); colorbar
    g4{i}=C;
end

axis square; box on
figure_bigger(16)
xlim([-3 3]); ylim([-3 3])
title('Group 4')

%% Topologicall equivalent networks

% Simulation should generate random newtorks with topological equivalence
% while there is huge geometric difference. The simulation is degined 
% in such a way to redcude the performandce of Euclidean distance based
% measures. So the traditional k-means clustring will differeniate them as different 
%
% The simulation model is first introduced in 
% Chung, M.K., Huang, S.-G., Carroll, I.C., Calhoun, V.D., Goldsmith, H.H. 
% 2022 Wasserstein graph clustering in determining the genetic contribution 
% of state changes in rs-fMRI, Annual Meeting of the Organization for Human Brain Mapping (OHBM)
% https://pages.stat.wisc.edu/~mchung/papers/HBM2022/chung.2022.OHBM.pdf

%Group 1, 2, 3 and 4 will be topologically equivalent

%------
%Group 1: two circles horizontally 
figure; subplot(2,2,1)

coord = graph_circle([2 0],1, 60, 0)
plot(coord(:,1),coord(:,2), 'Color',[.7 .7 .7], 'LineWidth',1)';

coord = graph_circle([-1 0],1.5, 60, 0)
hold on; plot(coord(:,1),coord(:,2),'Color',[.7 .7 .7], 'LineWidth',1)';

for i=1:5
    circle1 = graph_circle([2 0],1, 60, sigma);
    circle2 = graph_circle([-1 0],1.5, 60, sigma);
    obs =[circle1; circle2];
    hold on; plot(obs(:,1), obs(:,2),'.k');
    coord=[obs(:,1)  obs(:,2)];
    C = pdist(coord);
    C=squareform(C);
    %figure; imagesc(C); colorbar
    g1{i}=C;
end

axis square
figure_bigger(16)
xlim([-3 3]); ylim([-3 3])
title('Group 1')


%--------------
%Group 2: two circles rorated 180 degree producing geometrically different
%networks but topologically equivalent configuration

subplot(2,2,2)

coord = graph_circle([-2 0],1, 60, 0)
plot(coord(:,1),coord(:,2), 'Color',[.7 .7 .7], 'LineWidth',1)';

coord = graph_circle([1 0],1.5, 60, 0)
hold on; plot(coord(:,1),coord(:,2),'Color',[.7 .7 .7], 'LineWidth',1)';

for i=1:5
    circle1 = graph_circle([-2 0],1, 60, sigma);
    circle2 = graph_circle([1 0],1.5, 60, sigma);
    obs =[circle1; circle2];
    hold on; plot(obs(:,1), obs(:,2),'.k');
    coord=[obs(:,1)  obs(:,2)];
    C = pdist(coord);
    C=squareform(C);
    %figure; imagesc(C); colorbar 
    g2{i}=C;
end

axis square
figure_bigger(16)
xlim([-3 3]); ylim([-3 3])
title('Group 2')

%--------------
%Group 3: two circles rorated 90 degree producing geometrically different
%networks but topologically equivalent configuration


subplot(2,2,3)

coord = graph_circle([0 2],1, 60, 0)
plot(coord(:,1),coord(:,2), 'Color',[.7 .7 .7], 'LineWidth',1)';

coord = graph_circle([0 -1],1.5, 60, 0)
hold on; plot(coord(:,1),coord(:,2),'Color',[.7 .7 .7], 'LineWidth',1)';

for i=1:5
    circle1 = graph_circle([0 2],1, 60, sigma);
    circle2 = graph_circle([0 -1],1.5, 60, sigma);
    obs =[circle1; circle2];
    hold on; plot(obs(:,1), obs(:,2),'.k');
    coord=[obs(:,1)  obs(:,2)];
    C = pdist(coord);
    C=squareform(C);
    %figure; imagesc(C); colorbar
    g3{i}=C;
end

axis square
figure_bigger(16)
xlim([-3 3]); ylim([-3 3])
title('Group 3')

%--------------
%Group 4: two circles rorated 90 degree producing geometrically different
%networks but topologically equivalent configuration

subplot(2,2,4)

coord = graph_circle([0 1],1.5, 60, 0)
plot(coord(:,1),coord(:,2), 'Color',[.7 .7 .7], 'LineWidth',1)';

coord = graph_circle([0 -2],1, 60, 0)
hold on; plot(coord(:,1),coord(:,2),'Color',[.7 .7 .7], 'LineWidth',1)';

for i=1:5
    circle1 = graph_circle([0 1],1.5, 60, sigma);
    circle2 = graph_circle([0 -2],1, 60, sigma);
    obs =[circle1; circle2];
    hold on; plot(obs(:,1), obs(:,2),'.k');
    coord=[obs(:,1)  obs(:,2)];
    C = pdist(coord);
    C=squareform(C);
    g4{i}=C;
end

axis square
figure_bigger(16)
xlim([-3 3]); ylim([-3 3])
title('Group 4')


