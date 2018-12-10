function [pt3d] = reComputeLiDARPoint2CC(pt3d, gps_rec_1, gps_rec_2, calib_lidar, current_gps, calib_camera)
%%

% test; add a drift to the 2nd gps record
% drift_vec = [1000.0, 0, 0];
% gps_rec_2.point.utm = gps_rec_2.point.utm + drift_vec;

% update utm for laser points
angle = pt3d.angle;
dist = pt3d.dist;
%
lpt = [dist * sin(angle), dist * cos(angle), 0];
vpt = LiDARCoordToVehicleCoord(lpt, calib_lidar);

% linear interpolation
vpose = linearInterpolate(gps_rec_1, gps_rec_2, pt3d.UTC);

wpt = VehicleCoordToWorldCoord(vpt, vpose);

% convert back to vpt
vpt = WorldCoordToVehicleCoord(wpt, current_gps);

% convert back to cpt
cpt = VehicleCoordToCameraCoord(vpt, calib_camera);

%
pt3d.point.utm = cpt;

