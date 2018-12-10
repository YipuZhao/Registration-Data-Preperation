function [las_list] = loadPointCloud(filename, time_start, time_end)

%%
fileID = fopen(filename);
fgetl(fileID);
%[ID, X, Y, Z, Angle, Dist, Retro, UTC]
pt3d = textscan(fileID, '%d,%f,%f,%f,%f,%f,%f,%f');
fclose(fileID);

% X = pt3d{2};
% Y = pt3d{3};
% Z = pt3d{4};
% Retro = pt3d{7};
UTC = pt3d{1,8};
index = find( UTC >= (time_start-1) & UTC <= (time_end+1));
las_list = cell(size(index));
for idx = index'%1 : size(pt3d{1}, 1)
    las_tmp.UTC = pt3d{8}(idx);
    las_tmp.point.utm(1) = pt3d{2}(idx);
    las_tmp.point.utm(2) = pt3d{3}(idx);
    las_tmp.point.utm(3) = pt3d{4}(idx);
    las_tmp.angle = pt3d{5}(idx);
    las_tmp.dist = pt3d{6}(idx);
    las_tmp.retro = pt3d{7}(idx);
    
    las_list{idx-index(1)+1} = las_tmp;
end