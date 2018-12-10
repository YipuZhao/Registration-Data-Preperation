function [grad_m] = findGradient3DAttr(pt3d_sur, pt3d_tar)
%%
grad_vec = zeros(1,3);
for i=1:size(pt3d_sur, 1)
    tmp_vec = pt3d_sur(i, 1:3) - pt3d_tar(1:3);
    if norm(tmp_vec) > 0
        tmp_vec = tmp_vec / norm(tmp_vec);
        %
        grad_vec = grad_vec + tmp_vec * (pt3d_sur(i, 4) - pt3d_tar(4));
    end
end

grad_m = norm(grad_vec);