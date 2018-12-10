function [grad_img] = backGroundEdgeRemoval(grad_img, range_img)
%%
diff_thres = 0.3;
%
ept_idx = find(abs(grad_img) > 0);
[pt_x, pt_y] = ind2sub(size(grad_img), ept_idx);
neighbor_rng = zeros(length(ept_idx), 4);
% get 4-neighbor
has_left = pt_y-1 > 0;
neighbor_rng(has_left, 1) = range_img(sub2ind(size(grad_img), pt_x(has_left), pt_y(has_left)-1));
has_right = pt_y+1 <= size(range_img, 2);
neighbor_rng(has_right, 2) = range_img(sub2ind(size(grad_img), pt_x(has_right), pt_y(has_right)+1));
has_up = pt_x-1 > 0;
neighbor_rng(has_up, 3) = range_img(sub2ind(size(grad_img), pt_x(has_up)-1, pt_y(has_up)));
has_down = pt_x+1 <= size(range_img, 1);
neighbor_rng(has_down, 4) = range_img(sub2ind(size(grad_img), pt_x(has_down)+1, pt_y(has_down)));
%
% is_bg = max(neighbor_rng, [], 2)-scan_img(sub2ind(size(grad_img), pt_x, pt_y)) < diff_thres;
% grad_img(sub2ind(size(grad_img), pt_x(is_bg), pt_y(is_bg))) = 0;
is_bg = range_img(sub2ind(size(grad_img), pt_x, pt_y)) - min(neighbor_rng, [], 2) >= diff_thres;
grad_img(sub2ind(size(grad_img), pt_x(is_bg), pt_y(is_bg))) = 0;