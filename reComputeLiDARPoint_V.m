function [pt3d] = reComputeLiDARPoint_V(pt3d, gps_rec_1, gps_rec_2, calib_lidar)
%%

% test; add a drift to the 2nd gps record
% drift_vec = [1000.0, 0, 0];
% gps_rec_2.point.utm = gps_rec_2.point.utm + drift_vec;

% update utm for laser points
angle = pt3d.angle;
dist = pt3d.dist;
%
lpt = [0, dist * cos(angle), dist * sin(angle)];
vpt = LiDARCoordToVehicleCoord(lpt, calib_lidar);

% linear interpolation
vpose = linearInterpolate(gps_rec_1, gps_rec_2, pt3d.UTC);

wpt = VehicleCoordToWorldCoord(vpt, vpose);
%
pt3d.point.utm = wpt;

