close all;

% addpath('..\..\data\kitti');

data_list = {
    'site1'; 'site2'; 'site3'; 'site4'; 
    'site1_v'; 'site2_v'; 'site3_v'; 'site4_v'; 
    'site2_run2'; 'site3_run2'; 'site2_run2_v'; 'site3_run2_v'; 
    'site2_run3'; 'site3_run3'; 'site2_run3_v'; 'site3_run3_v'; 
    'kitti0002'; 'kitti0093'; 'kitti0104'; 'kitti0106';
    'change_ref0_h'; 'change_ref0_v'; 'change_ref1_h'; 'change_ref1_v'; 'change_ref2_h'; 'change_ref2_v'; 
    'change_tilt0_h'; 'change_tilt0_v'; 'change_tilt1_h'; 'change_tilt1_v'; 'change_tilt2_h'; 'change_tilt2_v';
    'change_bend1_h'; 'change_bend1_v'; 'change_bend2_h'; 'change_bend2_v';
%     'change_ref2';
%     'change_tilt0'; 'change_tilt1'; 'change_tilt2';
'I475N_140903'; 'I475N_140903_v';
'I475N_141112'; 'I475N_141112_v';
'I475N_150326'; 'I475N_150326_v';
'I475N_150430'; 'I475N_150430_v';
'I475N_150529'; 'I475N_150529_v';
'I475N_150701'; 'I475N_150701_v';
'I475S_140903'; 'I475S_140903_v';
'I475S_150326'; 'I475S_150326_v';
'I475S_150430'; 'I475S_150430_v';
'I475S_150529'; 'I475S_150529_v';
'I475S_150701'; 'I475S_150701_v';
'calib_150326'; 'calib_150326_v';
    };
recompute.scan_image = 1;
recompute.points_features = 1;
recompute.pcd_vis = 1;

for i = [17,19:20]%13:16%:length(data_list)%13:24
    data_name = data_list{i};
    para = loadPara(data_name);
    
    [points, scan_img] = getPointCloudData(para, recompute);
end