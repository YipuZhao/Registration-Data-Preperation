function [gps_rec] = loadGPSRecord_short(filename, frame_min, frame_max)

%%
tmp_rec = xlsread(filename);

index = find( (tmp_rec(:,44)+1) >= frame_min & (tmp_rec(:,44)+1) <= frame_max);
gps_rec = cell(size(index));
for i=index' %1:length(tmp_rec)

    gps_tmp.UTC = tmp_rec(i, 4);
    
    lon = tmp_rec(i, 5);
    lat = tmp_rec(i, 6);
    uzone = 16;
    hemi = 'N';
    [gps_tmp.point.utm(1), gps_tmp.point.utm(2), uzone, hemi] = wgs2utm(lat, lon);
%     [gps_rec{i}.point.utm(1), gps_rec{i}.point.utm(2)] = longLatToUTM(tmp_rec(i, 5), tmp_rec(i, 6));
     gps_tmp.point.utm(3) = tmp_rec(i, 7);
    
    % heading (z), pitch (x), roll (y)
    gps_tmp.pose.angle(1) = tmp_rec(i, 18) - pi/2;
    gps_tmp.pose.angle(2) = deg2rad(tmp_rec(i, 19));
    gps_tmp.pose.angle(3) = deg2rad(tmp_rec(i, 20));
% gps_rec{i}.pose.angle(1) = deg2rad(tmp_rec(i, 19));
% gps_rec{i}.pose.angle(2) = deg2rad(tmp_rec(i, 20));
% gps_rec{i}.pose.angle(3) = tmp_rec(i, 18) - pi/2;

    gps_tmp.pose.matrix = makeRotationMatrix(gps_tmp.pose.angle);% * makeRotationMatrix([-pi/2,0,0]);
    gps_tmp.pose.inv_matrix = inv(gps_tmp.pose.matrix);
    
    gps_tmp.point.lat_accu = tmp_rec(i, 27);
    gps_tmp.point.lon_accu = tmp_rec(i, 28);
    gps_tmp.point.alt_accu = tmp_rec(i, 29);
    
    gps_tmp.pose.heading_accu = tmp_rec(i, 32);
    gps_tmp.pose.pitch_accu = tmp_rec(i, 31);
    gps_tmp.pose.roll_accu = tmp_rec(i, 30);
    
    gps_tmp.frameno = tmp_rec(i, 44) + 1;
    
    gps_rec{i-index(1)+1} = gps_tmp;
end