function [las_list, img_list, gps_list_short, gps_list_long, ...
    calib_camera, calib_lidar] = loadAllData(site_str, cam_pose, lms_vertical)

% global las_list
% global img_list
% global gps_list_short
% global gps_list_long

%%

[img_dir, dbf_dir, las_dir, xlsx_dir] = setDataPath(site_str, cam_pose, lms_vertical)

[img_list] = loadImageFromDir(img_dir);
img_list = cell2mat(img_list);
frame_min = min([img_list.frameno]);
frame_max = max([img_list.frameno]);

[gps_list_short] = loadGPSRecord_short(dbf_dir, frame_min, frame_max);
gps_list_short = cell2mat(gps_list_short);
time_start = min([gps_list_short.UTC]);
time_end = max([gps_list_short.UTC])+20;

[las_list] = loadPointCloud(las_dir, time_start, time_end);
las_list = cell2mat(las_list);

% [gps_list_long] = loadGPSRecord_long('sbet_Mission 1_part.DBF', time_start, time_end);
[gps_list_long] = loadGPSRecord_long(xlsx_dir, time_start, time_end);
gps_list_long = cell2mat(gps_list_long);

calib_camera = setCameraCalib(cam_pose);

if ~lms_vertical
    [calib_lidar] = setLiDARCalib_HD();
else
    [calib_lidar] = setLiDARCalib_V();
end