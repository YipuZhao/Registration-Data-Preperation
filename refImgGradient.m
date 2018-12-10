function [gm_img, gd_img] = refImgGradient(scan_img)
% 
% figure;
% imagesc(log(1+scan_img(:,:,2)'));
% figure;
% imagesc(scan_img(:,:,3)')

%% edge detection
% edpt_img = edge(scan_img(:,:,2)', 'canny', 0.006,0.06);
% figure;
% imagesc(edpt_img)

% edpt_img = edge(scan_img(:,:,2)', 'sobel', 0.2);
% figure;
% imagesc(edpt_img)

reflec_img = scan_img(:,:,3)';
% [gradx_img, grady_img] = imgradientxy_lidar(reflec_img);
[gm_img, gd_img] = imgradient(reflec_img);
% figure;
% imagesc(min(abs(gradx_img), 100));
% figure;
% imagesc(min(abs(grady_img), 100));

%% remove edge points on background
gm_img = backGroundEdgeRemoval(gm_img, scan_img(:,:,2)');
gd_img = backGroundEdgeRemoval(gd_img, scan_img(:,:,2)');

% ept_idx = find(abs(grady_img) > 0);
% [pt_x, pt_y] = ind2sub(size(grady_img), ept_idx);
% neighbor_rng = zeros(length(ept_idx),2);
% has_left = pt_x-1 > 0;
% neighbor_rng(has_left, 1) = reflec_img(sub2ind(size(grady_img), pt_x(has_left)-1, pt_y(has_left)));
% has_right = pt_x+1 <= size(reflec_img, 1);
% neighbor_rng(has_right, 2) = reflec_img(sub2ind(size(grady_img), pt_x(has_right)+1, pt_y(has_right)));
% is_far = max(neighbor_rng, [],2)-reflec_img(sub2ind(size(grady_img), pt_x, pt_y))< diff_thres;
% grady_img(sub2ind(size(grady_img), pt_x(is_far), pt_y(is_far))) = 0;

% gradx = (min(abs(gradx_img), 100));
% gradx(gradx < 0) = 0;
% gradx = abs(gradx);
% grady = (min(abs(grady_img), 100));
% grady(grady < 0) = 0;
% grady = abs(grady);

% figure; imagesc(gradx);
% figure; imagesc(grady);

