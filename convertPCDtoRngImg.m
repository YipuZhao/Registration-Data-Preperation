function [scan_img] = convertPCDtoRngImg(las_list, las_type)
%% parameters for lidar
if strcmp(las_type, 'GT_V')
    ang_step = -0.0103;
    ang_num = 134;
    ang_st = 0.7061;
    ang_ed = -0.66;
else
    ang_step = -0.00873;
    ang_num = 181;
    ang_st = 0.7854;
    ang_ed = -0.7854;
end
% time_start = 6.669059600000000e+04;
% time_end = 6.669059600000000e+04 + 100;

%% point cloud
% las_list: [ID, X, Y, Z, Angle, Dist, Retro, UTC]
pt_num = length(las_list)-1;

%% plot angle of points
% figure;
% plot([las_list(1:5000).angle]);

%% segment pcd into scanlines
ang_list = [las_list(1:pt_num).angle];
ang_list_post = [las_list(2:pt_num+1).angle];

ang_diff = ang_list - ang_list_post;
% find all negative points in ang_diff
scan_idx = find(ang_diff<0) + 1;

scan_img = zeros(length(scan_idx), ang_num, 4);

infinity = max([las_list.dist])+10;

parfor sn=1:length(scan_idx)
    %
    fprintf('processing scan line %d\n', sn);
    % scan start idx
    st_idx = scan_idx(sn);
    if sn < length(scan_idx)
        ed_idx = scan_idx(sn + 1);
    else
        ed_idx = length(ang_list);
    end
    % add invalid scan points
    cn = 1;
    scan_line = zeros(ang_num, 4);
    for pn=1:ang_num
        ang_cur = ang_st + ang_step * (pn-1);
        if st_idx + cn - 1 <= length(las_list) && ...
            abs(ang_cur - las_list(st_idx + cn - 1).angle) < abs(ang_step) * 0.5
            scan_line(pn, :) = [
                las_list(st_idx + cn - 1).angle, ...
                las_list(st_idx + cn - 1).dist,...
                las_list(st_idx + cn - 1).retro,...
                st_idx + cn - 1];
            cn = cn + 1;
        else
            scan_line(pn, :) = [ang_cur, infinity, 0, -1];
        end
    end
    
%     % plot scan line
%     close all;
%     figure;
%     plot(scan_line(:, 1))
%     hold on
%     plot(scan_line(:, 2))
%     plot(scan_line(:, 3))
    
    %
    scan_img(sn, :, :) = scan_line(:, :);
end

% close all;
% figure;
% imagesc(scan_img(:,:,1)')
% figure;
% imagesc(scan_img(:,:,2)')
% figure;
% imagesc(scan_img(:,:,3)')