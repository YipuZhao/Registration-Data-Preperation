function [las_list] = loadData(para)
if strcmp(para.data_type, 'Kitti')
    % load calibration
    calib = loadCalibrationCamToCam(fullfile(para.calib_dir,'calib_cam_to_cam.txt'));
    Tr_velo_to_cam = loadCalibrationRigid(fullfile(para.calib_dir,'calib_velo_to_cam.txt'));
    oxts = loadOxtsliteData(para.base_dir);
    %     pose = convertOxtsToPose(oxts);
    
    fileID = fopen([para.dir_name para.data_name '_Cam_GPS.txt'],'w');
    lno = para.frame(2) - para.frame(1) + 1;
    fprintf(fileID,'%d\n',lno);
    fprintf(fileID,'UTC x y z h p r frameno\n');
    scale = latToScale(oxts{1}(1));
    for i=1:lno
        % translation vector
        [t(1,1) t(2,1)] = latlonToMercator(oxts{i}(1),oxts{i}(2),scale);
        t(3,1) = oxts{i}(3);
        
        % rotation matrix (OXTS RT3000 user manual, page 71/92)
        rx = oxts{i}(4); % roll
        ry = oxts{i}(5); % pitch
        rz = oxts{i}(6); % heading
        
        fprintf(fileID,'%.6f %.6f %.6f %.6f %.6f %.6f %.6f %d\n', ...
            i, t, rz, ry, rx, i + para.frame(1) - 1);
    end
    fclose(fileID);
    
    % compute projection matrix velodyne->image plane
    R_cam_to_rect = eye(4);
    R_cam_to_rect(1:3,1:3) = calib.R_rect{1};
    para.P_velo_to_img = calib.P_rect{para.cam+1}*R_cam_to_rect*Tr_velo_to_cam;
    
    %         lno = 1;
    las_list = [];
    for fno = para.frame(1):para.frame(2)
        fid = fopen(sprintf(['%s/' para.las_name_format], para.las_dir, fno),'rb');
        velo = fread(fid,[4 inf],'single')';
        fclose(fid);
        % load and display image
        %         img = imread(sprintf('%s/%010d.png', para.img_dir, fno));
        %         fig = figure('Position',[20 100 size(img,2) size(img,1)]); axes('Position',[0 0 1 1]);
        %         imshow(img); hold on;
        
        % load velodyne points
        %         fid = fopen(sprintf('%s/%010d_new.bin',para.las_dir, fno),'rb');
        %         velo = fread(fid,[4 inf],'single')';
        %         % velo = velo(1:5:end,:); % remove every 5th point for display speed
        %         fclose(fid);
        
        % remove all points behind image plane (approximation
        dist = sqrt(sum(abs(velo(:, 1:3)).^2, 2));
        idx = dist <= 3.0;
        velo(idx,:) = [];
        
        % convert point to world coord
        lno = fno - para.frame(1) + 1;
        
        % translation vector
        [t(1,1), t(2,1)] = latlonToMercator(oxts{lno}(1),oxts{lno}(2),scale);
        t(3,1) = oxts{lno}(3);
        % rotation matrix (OXTS RT3000 user manual, page 71/92)
        rx = oxts{lno}(4); % roll
        ry = oxts{lno}(5); % pitch
        rz = oxts{lno}(6); % heading
        R = makeRotationMatrix([rz, ry, rx]);
%         R = makeRotationMatrix([ry, rx, rz]);
        
        velo_wc = R * velo(:, 1:3)' + repmat(t, 1, length(velo));
        
        %         % remove all points behind image plane (approximation
        %         idx = velo(:,1)<5;
        %         %         velo2 = velo;
        %         velo(idx,:) = [];
        %         figure;
        %         % project to image plane (exclude luminance)
        %         [velo_img] = project(velo(:,1:3),para.P_velo_to_img);
        %         % plot points
        %         cols = jet;
        %         scatter(velo_img(:,1), velo_img(:,2), 3*ones(size(velo_img(:,1))), velo(:,4), 'filled');
        %         close all;
        
        %                  las_list = cell(size(velo, 1), 1);
        %         las_list = [las_list; ...
        %             repmat(fno, size(velo,1), 1), velo(:,1:4), velo_img(:,1), velo_img(:,2)];
        %         las_list = [las_list; repmat(fno, size(velo,1), 1), velo(:,1:4)];
        las_list = [las_list; repmat(lno, size(velo,1), 1), velo_wc', velo(:,4)];
    end
else
    % load laser data
    [gps_list_short] = loadGPSRecord_short(para.GPS_short, para.frame(1), para.frame(2));
    gps_list_short = cell2mat(gps_list_short);
    %
    fileID = fopen([para.dir_name para.data_name '_Cam_GPS.txt'],'w');
    lno = size(gps_list_short,1);
    fprintf(fileID,'%d\n',lno);
    fprintf(fileID,'UTC x y z h p r frameno\n');
    for i=1:lno
        fprintf(fileID,'%.6f %.6f %.6f %.6f %.6f %.6f %.6f %d\n', ...
            gps_list_short(i).UTC, gps_list_short(i).point.utm, ...
            gps_list_short(i).pose.angle, gps_list_short(i).frameno);
    end
    fclose(fileID);
    %
    time_start = min([gps_list_short.UTC]);
    time_end = max([gps_list_short.UTC])+20;
    [las_list] = loadPointCloud(para.las_name, time_start, time_end);
    las_list = cell2mat(las_list);
end