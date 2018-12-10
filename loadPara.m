function [para] = loadPara(data_name)
para.data_name = data_name;
para.point_cloud_name = 'Scan_for_MI.txt';
para.scan_img_name = 'scan_img.mat';
switch data_name
    case 'site1'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20150706_CCW_Run1(0)\Site1\HD_20150706_CCW_Run1(0)_66599_66640.csv';
        para.frame = [443, 589];
        para.GPS_short = '..\..\data\20150706_CCW_Run1(0)\Site1\FC_20150706_CCW_Run1(0).DBF';
    case 'site1_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20150706_CCW_Run1(0)\Site1\V_20150706_CCW_Run1(0)_66599_66640.csv';
        para.frame = [443, 589];
        para.GPS_short = '..\..\data\20150706_CCW_Run1(0)\Site1\FC_20150706_CCW_Run1(0).DBF';
        %
    case 'site2'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20150706_CCW_Run1(0)\Site2\HD_20150706_CCW_Run1(0)_66687_66727.csv';
        para.frame = [847, 1029];
        para.GPS_short = '..\..\data\20150706_CCW_Run1(0)\Site2\FC_20150706_CCW_Run1(0).DBF';
    case 'site2_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20150706_CCW_Run1(0)\Site2\V_20150706_CCW_Run1(0)_66687_66727.csv';
        para.frame = [847, 1029];
        para.GPS_short = '..\..\data\20150706_CCW_Run1(0)\Site2\FC_20150706_CCW_Run1(0).DBF';
        %
    case 'site3'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20150706_CCW_Run1(0)\Site3\HD_20150706_CCW_Run1(0)_67383_67423.csv';
        para.frame = [4310, 4509];
        para.GPS_short = '..\..\data\20150706_CCW_Run1(0)\Site3\FC_20150706_CCW_Run1(0).DBF';
    case 'site3_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20150706_CCW_Run1(0)\Site3\V_20150706_CCW_Run1(0)_67383_67423.csv';
        para.frame = [4310, 4509];
        para.GPS_short = '..\..\data\20150706_CCW_Run1(0)\Site3\FC_20150706_CCW_Run1(0).DBF';
        %
    case 'site4'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20150706_CCW_Run1(0)\Site4\HD_20150706_CCW_Run1(0)_67509_67549.csv';
        para.frame = [4940, 5139];
        para.GPS_short = '..\..\data\20150706_CCW_Run1(0)\Site4\FC_20150706_CCW_Run1(0).DBF';
    case 'site4_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20150706_CCW_Run1(0)\Site4\V_20150706_CCW_Run1(0)_67509_67549.csv';
        para.frame = [4940, 5139];
        para.GPS_short = '..\..\data\20150706_CCW_Run1(0)\Site4\FC_20150706_CCW_Run1(0).DBF';
        %
    case 'site2_run2'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20150706_CCW_Run2(0)\Site2\HD_20150706_CCW_Run2(0)_68446_68494.csv';
        para.frame = [794, 993];
        para.GPS_short = '..\..\data\20150706_CCW_Run2(0)\Site2\FR_20150706_CCW_Run2(0).DBF';
    case 'site2_run2_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20150706_CCW_Run2(0)\Site2\V_20150706_CCW_Run2(0)_68446_68494.csv';
        para.frame = [794, 993];
        para.GPS_short = '..\..\data\20150706_CCW_Run2(0)\Site2\FR_20150706_CCW_Run2(0).DBF';
    case 'site3_run2'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20150706_CCW_Run2(0)\Site3\HD_20150706_CCW_Run2(0)_68871_68948.csv';
        para.frame = [2920, 3259];
        para.GPS_short = '..\..\data\20150706_CCW_Run2(0)\Site3\FR_20150706_CCW_Run2(0).DBF';
    case 'site3_run2_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20150706_CCW_Run2(0)\Site3\V_20150706_CCW_Run2(0)_68871_68948.csv';
        para.frame = [2920, 3259];
        para.GPS_short = '..\..\data\20150706_CCW_Run2(0)\Site3\FR_20150706_CCW_Run2(0).DBF';
        %
    case 'site2_run3'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20150710_CW_Run1(0)\Site2\HD_Clock_Run1(0)_52852_52900.csv';
        para.frame = [1861, 2060];
        para.GPS_short = '..\..\data\20150710_CW_Run1(0)\Site2\FR_Clock_Run1(0).DBF';
    case 'site2_run3_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20150710_CW_Run1(0)\Site2\V_Clock_Run1(0)_52852_52900.csv';
        para.frame = [1861, 2060];
        para.GPS_short = '..\..\data\20150710_CW_Run1(0)\Site2\FR_Clock_Run1(0).DBF';
    case 'site3_run3'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20150710_CW_Run1(0)\Site3\HD_Clock_Run1(0)_53254_53302.csv';
        para.frame = [3871, 4070];
        para.GPS_short = '..\..\data\20150710_CW_Run1(0)\Site3\FR_Clock_Run1(0).DBF';
    case 'site3_run3_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20150710_CW_Run1(0)\Site3\V_Clock_Run1(0)_53254_53302.csv';
        para.frame = [3871, 4070];
        para.GPS_short = '..\..\data\20150710_CW_Run1(0)\Site3\FR_Clock_Run1(0).DBF';
        %
    case 'kitti0002'
        para.data_type = 'Kitti';
        para.base_dir = '..\..\data\kitti\2011_09_26_drive_0002_sync\';
        para.frame = [0, 76];
%  para.frame = [0, 10];
    case 'kitti0093'
        para.data_type = 'Kitti';
        para.base_dir = '..\..\data\kitti\2011_09_26_drive_0093_sync\';
        para.frame = [0, 170];
    case 'kitti0104'
        para.data_type = 'Kitti';
        para.base_dir = '..\..\data\kitti\2011_09_26_drive_0104_sync\';
        para.frame = [0, 311];
    case 'kitti0106'
        para.data_type = 'Kitti';
        para.base_dir = '..\..\data\kitti\2011_09_26_drive_0106_sync\';
        para.frame = [0, 226];
        %
    case 'change_ref0_h'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20140530_Sign_Change\run3_reference_12ft(0)\HD_run3_reference_12ft(0).csv';
        para.frame = [1, 47];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run3_reference_12ft(0)\FC_run3_reference_12ft(0).DBF';
    case 'change_ref0_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20140530_Sign_Change\run3_reference_12ft(0)\v_run3_reference_12ft(0).csv';
        para.frame = [1, 47];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run3_reference_12ft(0)\FC_run3_reference_12ft(0).DBF';
    case 'change_ref1_h'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20140530_Sign_Change\run3_reference_12ft(1)\HD_run3_reference_12ft(1).csv';
        para.frame = [1, 47];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run3_reference_12ft(1)\FC_run3_reference_12ft(1).DBF';
    case 'change_ref1_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20140530_Sign_Change\run3_reference_12ft(1)\v_run3_reference_12ft(1).csv';
        para.frame = [1, 47];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run3_reference_12ft(1)\FC_run3_reference_12ft(1).DBF';
    case 'change_ref2_h'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20140530_Sign_Change\run3_reference_12ft(2)\HD_run3_reference_12ft(2).csv';
        para.frame = [1, 53];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run3_reference_12ft(2)\FC_run3_reference_12ft(2).DBF';
    case 'change_ref2_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20140530_Sign_Change\run3_reference_12ft(2)\v_run3_reference_12ft(2).csv';
        para.frame = [1, 53];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run3_reference_12ft(2)\FC_run3_reference_12ft(2).DBF';
        %
    case 'change_tilt0_h'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(0)\HD_run4_xtilt15_12ft(0).csv';
        para.frame = [1, 53];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(0)\FC_run4_xtilt15_12ft(0).DBF';
    case 'change_tilt0_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(0)\v_run4_xtilt15_12ft(0).csv';
        para.frame = [1, 53];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(0)\FC_run4_xtilt15_12ft(0).DBF';
    case 'change_tilt1_h'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(1)\HD_run4_xtilt15_12ft(1).csv';
        para.frame = [1, 53];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(1)\FC_run4_xtilt15_12ft(1).DBF';
    case 'change_tilt1_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(1)\v_run4_xtilt15_12ft(1).csv';
        para.frame = [1, 53];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(1)\FC_run4_xtilt15_12ft(1).DBF';
    case 'change_tilt2_h'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(2)\HD_run4_xtilt15_12ft(2).csv';
        para.frame = [1, 54];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(2)\FC_run4_xtilt15_12ft(2).DBF';
    case 'change_tilt2_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(2)\v_run4_xtilt15_12ft(2).csv';
        para.frame = [1, 54];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(2)\FC_run4_xtilt15_12ft(2).DBF';
    case 'change_bend1_h'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20140530_Sign_Change\run1_bend_12ft(1)\HD_run1_bend_12ft(1).csv';
        para.frame = [1, 44];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run1_bend_12ft(1)\FR_run1_bend_12ft(1).DBF';
    case 'change_bend1_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20140530_Sign_Change\run1_bend_12ft(1)\v_run1_bend_12ft(1).csv';
        para.frame = [1, 44];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run1_bend_12ft(1)\FR_run1_bend_12ft(1).DBF';
    case 'change_bend2_h'
        para.data_type = 'GT_H';
        para.las_name = '..\..\data\20140530_Sign_Change\run1_bend_12ft(2)\HD_run1_bend_12ft(2).csv';
        para.frame = [1, 43];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run1_bend_12ft(2)\FR_run1_bend_12ft(2).DBF';
    case 'change_bend2_v'
        para.data_type = 'GT_V';
        para.las_name = '..\..\data\20140530_Sign_Change\run1_bend_12ft(2)\v_run1_bend_12ft(2).csv';
        para.frame = [1, 43];
        para.GPS_short = '..\..\data\20140530_Sign_Change\run1_bend_12ft(2)\FR_run1_bend_12ft(2).DBF';
        %     case 'change_tilt1'
        %         para.data_type = 'GT_V';
        %         para.las_name = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(1)\v_run4_xtilt15_12ft(1).csv';
        %         para.frame = [1, 53];
        %         para.GPS_short = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(1)\FC_run4_xtilt15_12ft(1).DBF';
        %     case 'change_tilt2'
        %         para.data_type = 'GT_V';
        %         para.las_name = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(2)\v_run4_xtilt15_12ft(2).csv';
        %         para.frame = [1, 53];
        %         para.GPS_short = '..\..\data\20140530_Sign_Change\run4_xtilt15_12ft(2)\FC_run4_xtilt15_12ft(2).DBF';
    case 'I475N_140903'
        para.data_type = 'HWY_H';
        para.las_name = '..\..\data\20140903_I475\NB\HD_09032014_I475_NB_LANE3(0)_55450_55519.csv';
        para.frame = [1645, 1944];
        para.GPS_short = '..\..\data\20140903_I475\NB\FR_09032014_I475_NB_LANE3(0).DBF';
    case 'I475N_140903_v'
        para.data_type = 'HWY_V';
        para.las_name = '..\..\data\20140903_I475\NB\v_09032014_I475_NB_LANE3(0)_55450_55519.csv';
        para.frame = [1645, 1944];
        para.GPS_short = '..\..\data\20140903_I475\NB\FR_09032014_I475_NB_LANE3(0).DBF';
    case 'I475S_140903'
        para.data_type = 'HWY_H';
        para.las_name = '..\..\data\20140903_I475\SB\HD_09032014_I475_SB_LANE3(0)_53984_54055.csv';
        para.frame = [2797, 3096];
        para.GPS_short = '..\..\data\20140903_I475\SB\FR_09032014_I475_SB_LANE3(0).DBF';
    case 'I475S_140903_v'
        para.data_type = 'HWY_V';
        para.las_name = '..\..\data\20140903_I475\SB\v_09032014_I475_SB_LANE3(0)_53984_54055.csv';
        para.frame = [2797, 3096];
        para.GPS_short = '..\..\data\20140903_I475\SB\FR_09032014_I475_SB_LANE3(0).DBF';
        %
    case 'I475N_141112'
        para.data_type = 'HWY_H';
        para.las_name = '..\..\data\20141112_I475\NB\HD_20141112_I475_NB_Lane3_Run1(0)_73763_73831.csv';
        para.frame = [920, 1219];
        para.GPS_short = '..\..\data\20141112_I475\NB\FR_20141112_I475_NB_Lane3_Run1(0).DBF';
    case 'I475N_141112_v'
        para.data_type = 'HWY_V';
        para.las_name = '..\..\data\20141112_I475\NB\v_20141112_I475_NB_Lane3_Run1(0)_73763_73831.csv';
        para.frame = [920, 1219];
        para.GPS_short = '..\..\data\20141112_I475\NB\FR_20141112_I475_NB_Lane3_Run1(0).DBF';
        %
    case 'I475N_150326'
        para.data_type = 'HWY_H';
        para.las_name = '..\..\data\20150326_I475\NB\HD_20150326_I475_NB_LN3_SEG1(0)_54791_54868.csv';
        para.frame = [1013, 1312];
        para.GPS_short = '..\..\data\20150326_I475\NB\FR_20150326_I475_NB_LN3_SEG1(0).DBF';
    case 'I475N_150326_v'
        para.data_type = 'HWY_V';
        para.las_name = '..\..\data\20150326_I475\NB\V_20150326_I475_NB_LN3_SEG1(0)_54791_54868.csv';
        para.frame = [1013, 1312];
        para.GPS_short = '..\..\data\20150326_I475\NB\FR_20150326_I475_NB_LN3_SEG1(0).DBF';
    case 'I475S_150326'
        para.data_type = 'HWY_H';
        para.las_name = '..\..\data\20150326_I475\SB\HD_20150326_I475_SB_LN3_SEG1_RUN2(0)_63590_63665.csv';
        para.frame = [1908, 2207];
        para.GPS_short = '..\..\data\20150326_I475\SB\FR_20150326_I475_SB_LN3_SEG1_RUN2(0).DBF';
    case 'I475S_150326_v'
        para.data_type = 'HWY_V';
        para.las_name = '..\..\data\20150326_I475\SB\V_20150326_I475_SB_LN3_SEG1_RUN2(0)_63590_63665.csv';
        para.frame = [1908, 2207];
        para.GPS_short = '..\..\data\20150326_I475\SB\FR_20150326_I475_SB_LN3_SEG1_RUN2(0).DBF';
        %
    case 'I475N_150430'
        para.data_type = 'HWY_H';
        para.las_name = '..\..\data\20150430_I475\NB\HD_20150430_I475_NB_LN3_SEG1(0)_56761_56836.csv';
        para.frame = [1012, 1311];
        para.GPS_short = '..\..\data\20150430_I475\NB\FR_20150430_I475_NB_LN3_SEG1(0).DBF';
    case 'I475N_150430_v'
        para.data_type = 'HWY_V';
        para.las_name = '..\..\data\20150430_I475\NB\V_20150430_I475_NB_LN3_SEG1(0)_56761_56836.csv';
        para.frame = [1012, 1311];
        para.GPS_short = '..\..\data\20150430_I475\NB\FR_20150430_I475_NB_LN3_SEG1(0).DBF';
    case 'I475S_150430'
        para.data_type = 'HWY_H';
        para.las_name = '..\..\data\20150430_I475\SB\HD_20150430_I475_SB_LN3_SEG1(0)_55243_55314.csv';
        para.frame = [1720, 2019];
        para.GPS_short = '..\..\data\20150430_I475\SB\FR_20150430_I475_SB_LN3_SEG1(0).DBF';
    case 'I475S_150430_v'
        para.data_type = 'HWY_V';
        para.las_name = '..\..\data\20150430_I475\SB\V_20150430_I475_SB_LN3_SEG1(0)_55243_55314.csv';
        para.frame = [1720, 2019];
        para.GPS_short = '..\..\data\20150430_I475\SB\FR_20150430_I475_SB_LN3_SEG1(0).DBF';
        %
    case 'I475N_150529'
        para.data_type = 'HWY_H';
        para.las_name = '..\..\data\20150529_I475\NB\HD_20150529_I475_NB_LN3_SEG1(0)_60429_60505.csv';
        para.frame = [1012, 1311];
        para.GPS_short = '..\..\data\20150529_I475\NB\FR_20150529_I475_NB_LN3_SEG1(0).DBF';
    case 'I475N_150529_v'
        para.data_type = 'HWY_V';
        para.las_name = '..\..\data\20150529_I475\NB\V_20150529_I475_NB_LN3_SEG1(0)_60429_60505.csv';
        para.frame = [1012, 1311];
        para.GPS_short = '..\..\data\20150529_I475\NB\FR_20150529_I475_NB_LN3_SEG1(0).DBF';
    case 'I475S_150529'
        para.data_type = 'HWY_H';
        para.las_name = '..\..\data\20150529_I475\SB\HD_20150529_I475_SB_LN3_SEG1(0)_61939_62013.csv';
        para.frame = [1908, 2207];
        para.GPS_short = '..\..\data\20150529_I475\SB\FR_20150529_I475_SB_LN3_SEG1(0).DBF';
    case 'I475S_150529_v'
        para.data_type = 'HWY_V';
        para.las_name = '..\..\data\20150529_I475\SB\V_20150529_I475_SB_LN3_SEG1(0)_61939_62013.csv';
        para.frame = [1908, 2207];
        para.GPS_short = '..\..\data\20150529_I475\SB\FR_20150529_I475_SB_LN3_SEG1(0).DBF';
        %
    case 'I475N_150701'
        para.data_type = 'HWY_H';
        para.las_name = '..\..\data\20150701_I475\NB\HD_20150701_I475_NB_LN3_SEG1(0)_60938_61008.csv';
        para.frame = [1018, 1317];
        para.GPS_short = '..\..\data\20150701_I475\NB\FR_20150701_I475_NB_LN3_SEG1(0).DBF';
    case 'I475N_150701_v'
        para.data_type = 'HWY_V';
        para.las_name = '..\..\data\20150701_I475\NB\V_20150701_I475_NB_LN3_SEG1(0)_60938_61008.csv';
        para.frame = [1018, 1317];
        para.GPS_short = '..\..\data\20150701_I475\NB\FR_20150701_I475_NB_LN3_SEG1(0).DBF';
    case 'I475S_150701'
        para.data_type = 'HWY_H';
        para.las_name = '..\..\data\20150701_I475\SB\HD_20150701_I475_SB_LN3_SEG1_RUN3(0)_59439_59510.csv';
        para.frame = [1665, 1964];
        para.GPS_short = '..\..\data\20150701_I475\SB\FR_20150701_I475_SB_LN3_SEG1_RUN3(0).DBF';
    case 'I475S_150701_v'
        para.data_type = 'HWY_V';
        para.las_name = '..\..\data\20150701_I475\SB\V_20150701_I475_SB_LN3_SEG1_RUN3(0)_59439_59510.csv';
        para.frame = [1665, 1964];
        para.GPS_short = '..\..\data\20150701_I475\SB\FR_20150701_I475_SB_LN3_SEG1_RUN3(0).DBF';
        %
    case 'calib_150326'
        para.data_type = 'HWY_H';
        para.las_name = '..\..\data\20150326_I475\Calib\HD_20150326_I475_NB_LN3_SEG1(0)_54631_54683.csv';
        para.frame = [270, 479];
        para.GPS_short = '..\..\data\20150326_I475\Calib\FR_20150326_I475_NB_LN3_SEG1(0).DBF';
    case 'calib_150326_v'
        para.data_type = 'HWY_V';
        para.las_name = '..\..\data\20150326_I475\Calib\V_20150326_I475_NB_LN3_SEG1(0)_54631_54683.csv';
        para.frame = [270, 479];
        para.GPS_short = '..\..\data\20150326_I475\Calib\FR_20150326_I475_NB_LN3_SEG1(0).DBF';
end

if strcmp(para.data_type, 'GT_H')
    para.dir_name = '..\..\data\GT_reorg\';
    para.ref_edge_thrd = 0.2;%0.3;
    para.rng_edge_thrd = 5;
elseif strcmp(para.data_type, 'GT_V')
    para.dir_name = '..\..\data\GT_reorg\';
    para.ref_edge_thrd = 1;
    para.rng_edge_thrd = 15;
elseif strcmp(para.data_type, 'HWY_H')
    para.dir_name = '..\..\data\Hwy_reorg\';
    para.ref_edge_thrd = 0.2;%0.3;
    para.rng_edge_thrd = 5;
elseif strcmp(para.data_type, 'HWY_V')
    para.dir_name = '..\..\data\Hwy_reorg\';
    para.ref_edge_thrd = 1;
    para.rng_edge_thrd = 15;
elseif strcmp(para.data_type, 'Kitti')
    para.cam = 2;
    para.calib_dir = '..\..\data\kitti\';
    para.las_dir = sprintf('%s/velodyne_points/data/', para.base_dir);
    para.img_dir = sprintf('%s/image_02/data/', para.base_dir);
%     para.gps_dir = sprintf('%s/oxts/data/', para.base_dir);
    para.las_name_format = '%010d_new.bin';
    para.dir_name = '..\..\data\kitti\';
    %         para.x0 = [-0.477399, -0.167731, 0.329471, -0.104290, -0.018124, -0.346884];
end