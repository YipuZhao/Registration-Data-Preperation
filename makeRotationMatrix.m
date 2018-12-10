function [rotate_mat] = makeRotationMatrix(angle_vec)
%%
% angle_vec: heading, pitch, roll
rot_z = [cos(angle_vec(1)), -sin(angle_vec(1)), 0;
         sin(angle_vec(1)), cos(angle_vec(1)), 0;
         0, 0, 1];
     
rot_x = [1, 0, 0;
         0, cos(angle_vec(2)), -sin(angle_vec(2));
         0, sin(angle_vec(2)), cos(angle_vec(2))];

rot_y = [cos(angle_vec(3)), 0, sin(angle_vec(3));
         0, 1, 0;
         -sin(angle_vec(3)), 0, cos(angle_vec(3))];


rotate_mat = rot_z * rot_x * rot_y;

% angle_vec: x, y, z
% rot_z = [cos(angle_vec(3)), -sin(angle_vec(3)), 0;
%          sin(angle_vec(3)), cos(angle_vec(3)), 0;
%          0, 0, 1];
% 
% rot_y = [cos(angle_vec(2)), 0, sin(angle_vec(2));
%          0, 1, 0;
%          -sin(angle_vec(2)), 0, cos(angle_vec(2))];
%      
% rot_x = [1, 0, 0;
%          0, cos(angle_vec(1)), -sin(angle_vec(1));
%          0, sin(angle_vec(1)), cos(angle_vec(1))];
% 
% rotate_mat = rot_z * rot_y * rot_x;