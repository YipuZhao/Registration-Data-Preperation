function [] = savePoints(points, para)
fileID = fopen([para.dir_name para.data_name '_' para.point_cloud_name],'w');
fprintf(fileID,'%d\n',size(points,1));
fprintf(fileID,'UTC x y z refc182 refc_eq nx ny nz cur grad_ref grad_rng\n');
fprintf(fileID,'%.6f %.6f %.6f %.6f %3d %3d %.6f %.6f %.6f %.6f %.6f %.6f\n',points');
fclose(fileID);