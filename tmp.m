points = las_list(:,2:end);

X = points(:,1);
Y = points(:,2);
Z = points(:,3);
[rx,ry,r] = cart2sph(X,Y,Z);
ry = ry/3;
% r = 100*ones(size(r));
% [x,y,z] = sph2cart(azimuth,elevation,r);
% figure;
% o = 10;
% scatter3(x(1:o:end),y(1:o:end),z(1:o:end),10*ones(size(x(1:o:end))),points(1:o:end,4),'filled');

% figure;
% scatter(azimuth,elevation,10*ones(size(azimuth)),depth);
id = rx>-1.5 & rx<1.5;
rx(~id) = [];
ry(~id) = [];
r(~id) = [];
X(~id) = [];
Y(~id) = [];
Z(~id) = [];
points(~id,:) = [];



nz = points(:,7);
pavement = abs(nz)>para.pavement.thrd_nz;
med_z = median(Z(pavement));
pavement(abs(Z-med_z)>=para.pavement.thrd_z)=0;

% figure; scatter(rx,ry,5*ones(size(rx)),pavement,'filled');
% axis equal
% ylim([-0.2, 0.1]);
% xlim([-1.5,1.5]);
% 
% figure; scatter(rx,ry,2*ones(size(rx)),points(:,4),'filled');
% axis equal
% ylim([-0.2, 0.1]);
% xlim([-1.5,1.5]);

points(pavement,:) =[];
X = points(:,1);
Y = points(:,2);
Z = points(:,3);
[rx,ry,r] = cart2sph(X,Y,Z);
ry = ry/3;
% figure; scatter(rx,ry,2*ones(size(rx)),points(:,4),'filled');
% ylim([-0.2, 0.05]);
% xlim([-1.5,1.5]);

threshold = para.graph.theta;
nRadius = 100;
min_size = 300;
p = [rx, ry];
[n,d]=knnsearch(p,p,'k',nRadius);
p = 1:size(p,1);
p = (ones(nRadius,1)*p)';
dx = abs(X(p(:))-X(n(:)));
dy = abs(Y(p(:))-Y(n(:)));
dz = abs(Z(p(:))-Z(n(:)));
d = sqrt(sum([dx, dy, dz].^2, 2));
d = reshape(d,[],nRadius);
d = d/max(d(:))*100;
L = GraphSeg_mex(ones(size(r)), threshold, min_size, nRadius, n-1, d);
label = grp2idx(L);
c = zeros(size(label));
group_num = max(label);
r = rand(group_num,1);
for i = 1:group_num
    c(label==i)=r(i);
end
[L,~] = grp2idx(c);
figure; scatter(rx,ry,5*ones(size(rx)),L,'filled');
ylim([-0.2, 0.05]);
xlim([-1.5,1.5]);
group_num
% d = abs(r(p(:))-r(n(:)));
% d = reshape(d,[],nRadius);
% L = GraphSeg_mex(zeros(size(r)), threshold, min_size, nRadius, n-1, d);
% figure; scatter(rx,ry,5*ones(size(rx)),L,'filled');
% ylim([-0.2, 0.05]);
% xlim([-1.5,1.5]);