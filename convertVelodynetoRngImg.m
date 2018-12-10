function [scan_img_list] = convertVelodynetoRngImg(las_list, para)
%%
azi_step = 0.0031
ele_step = 0.00003%0.0001%

for fno = para.frame(1):para.frame(2)
    fidx = find(las_list(:,1)==fno);
    las_frame = las_list(fidx, :);
    utm = las_frame(:, 2:4);
    depth = sqrt(sum(utm(:,[1,2,3]).^2,2));
    refc = las_frame(:, 5) * 255;
    %
    [azimuth, elevation, r] = cart2sph(utm(:, 1), utm(:, 2), utm(:, 3));
    
    figure; scatter(azimuth,elevation,2*ones(size(azimuth)),depth,'filled');
axis equal
ylim([-0.6, 0.3]);
xlim([-3.2,3.2]);

figure; scatter(azimuth,elevation,2*ones(size(azimuth)),refc,'filled');
axis equal
ylim([-0.6, 0.3]);
xlim([-3.2,3.2]);

%     min_azi = min(azimuth);
%     max_azi = max(azimuth);
%     img_w = ceil((max_azi - min_azi) / azi_step)+1;
%     min_ele = min(elevation);
%     max_ele = max(elevation);
%     img_h = ceil((max_ele - min_ele) / ele_step)+1;
%     %
%     scan_img = -1 * ones(img_w, img_h);
%     u = round((azimuth - min_azi) / azi_step);
%     v = round((elevation - min_ele) / ele_step);
%     indices = sub2ind(size(scan_img), u+1, v+1);
%     scan_img(indices) = refc;
    %
%         figure;
%     imagesc(scan_img')
%     scan_img_list{fno - para.frame(1) + 1} = scan_img;
end