function savepcd(fname, points, intensity)
% save points in xyz format
% TODO
%  binary format, RGB
num = length(intensity);
points = points - repmat(points(1,:),[size(points,1),1]);

fp = fopen(fname, 'w');

fprintf(fp, '# .PCD v.7 - Point Cloud Data file format');
fprintf(fp, 'VERSION .7\n');

% rgb data as well
fprintf(fp, 'FIELDS x y z intensity\n');
fprintf(fp, 'SIZE 4 4 4 4\n');
fprintf(fp, 'TYPE F F F I\n');
fprintf(fp, 'COUNT 1 1 1 1\n');

fprintf(fp, 'WIDTH %d\n', num);
fprintf(fp, 'HEIGHT 1\n'); % unorganized point cloud
fprintf(fp, 'POINTS %d\n', num);
fprintf(fp, 'DATA ascii\n');


fprintf(fp, '%f %f %f %f\n', [points, intensity]');

fclose(fp);
