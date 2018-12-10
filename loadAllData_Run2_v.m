function [las_list, img_list, gps_list_short, gps_list_long, calib_camera, calib_lidar] = loadAllData_Run2_v()

% global las_list
% global img_list
% global gps_list_short
% global gps_list_long

%%

[img_list] = loadImageFromDir('..\..\data\FC_06132014_CounterClock_Run2(0)\FC\');
img_list = cell2mat(img_list);
frame_min = min([img_list.frameno]);
frame_max = max([img_list.frameno]);

[gps_list_short] = loadGPSRecord_short('..\..\data\FC_06132014_CounterClock_Run2(0)\FC_06132014_CounterClock_Run2(0).DBF', frame_min, frame_max);
gps_list_short = cell2mat(gps_list_short);
time_start = min([gps_list_short.UTC]);
time_end = max([gps_list_short.UTC])+20;

[las_list] = loadPointCloud('..\..\data\FC_06132014_CounterClock_Run2(0)\v_06132014_CounterClock_Run2(0)_65844_65884.csv', time_start, time_end);
las_list = cell2mat(las_list);

% [gps_list_long] = loadGPSRecord_long('sbet_Mission 1_part.DBF', time_start, time_end);
[gps_list_long] = loadGPSRecord_long('..\..\data\FC_06132014_CounterClock_Run2(0)\Run2(0)_long.xlsx', time_start, time_end);
gps_list_long = cell2mat(gps_list_long);

[calib_camera] = setCameraCalib();
[calib_lidar] = setLiDARCalib();