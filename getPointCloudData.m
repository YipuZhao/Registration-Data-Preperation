function [points, scan_img] = getPointCloudData(para, recompute)

% load laser data
if recompute.scan_image || recompute.points_features
    [las_list] = loadData(para);
end

% scan_image : angle, dist, refc, index
if recompute.scan_image
    if strcmp(para.data_type, 'Kitti')
        %         [scan_img] = convertVelodynetoRngImg(las_list, para);
        scan_img = [];
    else
        [scan_img] = convertPCDtoRngImg(las_list, para.data_type);
        save([para.dir_name para.data_name '_' para.scan_img_name],'scan_img');
    end
else
    load([para.dir_name para.data_name '_' para.scan_img_name]);
end

% points_features : UTC x y z refc182 refc_eq nx ny nz cur edge
if recompute.points_features
    if strcmp(para.data_type, 'Kitti')
        % compute for each frame
        points = [];
        for fno = para.frame(1):para.frame(2)
            fidx = find(las_list(:,1)==fno);
            las_frame = las_list(fidx, :);
            utm = las_frame(:, 2:4);
            UTC = las_frame(:, 1);
            refc = las_frame(:, 5) * 255;
            refc_eq = histeq(refc);
            %             ipt = las_fr[points, scan_img] = getPointCloudData(para, recompute);ame(:, 6:7);
            [normals, curvature]=findPointNormals(utm, 50, [0,0,0]);
            %
            MdlKDT = KDTreeSearcher(utm);
            % MdlKDT.
            knn_idx = knnsearch(MdlKDT,utm, 'K', 50);
            refGradM = zeros(length(knn_idx), 1);
            rngGradM = zeros(length(knn_idx), 1);
            parfor i=1:length(knn_idx)
                tmp_p3d = utm(knn_idx(i, :), :);
                refGradM(i) = findGradient3DAttr([tmp_p3d, refc(knn_idx(i, :))], [utm(i, :), refc(i)]);
                tmp_dist = zeros(size(tmp_p3d,1), 1);
                for j=1:size(tmp_p3d,1)
                    tmp_dist(j) = norm(tmp_p3d(j, :));
                end
                rngGradM(i) = findGradient3DAttr([tmp_p3d, tmp_dist], [utm(i, :), norm(utm(i, :))]);
            end
            %
            points_frame = [UTC, utm, refc, refc_eq, normals, curvature, refGradM, rngGradM];
            points = [points; points_frame];
        end
        %         utm = las_list(:, 2:4);
        %         UTC = las_list(:, 1);
        %         refc = las_list(:, 5) * 255;
        %         refc_eq = histeq(refc);
        %
        savepcd([para.dir_name para.data_name '_Scan_for_MI.pcd'], points(:, 2:4), points(:, 6));
        %
        %         %             ipt = las_fr[points, scan_img] = getPointCloudData(para, recompute);ame(:, 6:7);
        %         [normals, curvature]=findPointNormals(utm, 50, [0,0,0]);
        %         %
        %         MdlKDT = KDTreeSearcher(utm);
        %         % MdlKDT.
        %         knn_idx = knnsearch(MdlKDT,utm, 'K', 50);
        %         refGradM = zeros(length(knn_idx), 1);
        %         rngGradM = zeros(length(knn_idx), 1);
        %         parfor i=1:length(knn_idx)
        %             tmp_p3d = utm(knn_idx(i, :), :);
        %             refGradM(i) = findGradient3DAttr([tmp_p3d, refc(knn_idx(i, :))], [utm(i, :), refc(i)]);
        %             tmp_dist = zeros(size(tmp_p3d,1), 1);
        %             for j=1:size(tmp_p3d,1)
        %                 tmp_dist(j) = norm(tmp_p3d(j, :));
        %             end
        %             rngGradM(i) = findGradient3DAttr([tmp_p3d, tmp_dist], [utm(i, :), norm(utm(i, :))]);
        %         end
        %         %
        %         points = [UTC, utm, refc, refc_eq, normals, curvature, refGradM, rngGradM];
    else
        idx = scan_img(:,:,4)';
        % 1:5
        point = [las_list.point]';
        utm = reshape([point.utm],3,[])';
        UTC = [las_list.UTC]';
        refc = [las_list.retro]';
        % 6:8, 9
        [normals,curvature]=findPointNormals(utm, 15, [0,0,0]);
        refc = floor(refc*1000/5.5);
        % ref grad
        [refGradM, ~] = refImgGradient(scan_img);
        refGradM = refGradM(:);
        refGradM(idx<=0) = [];
        % rng grad
        [rngGradM, ~] = rngImgGradient(scan_img);
        rngGradM = rngGradM(:);
        rngGradM(idx<=0) = [];
        % edge (ref + rng)
        %         edge = refGradM>para.ref_edge_thrd | refGradD>para.ref_edge_thrd | ...
        %             rngGradM>para.rng_edge_thrd | rngGradD>para.rng_edge_thrd;
        %         edge = refGradX>para.ref_edge_thrd | refGradY>para.ref_edge_thrd;
        % refc_eq
        refc_eq = adapthisteq(scan_img(:,:,3))';
        refc_eq = refc_eq(:);
        refc_eq(idx<=0) = [];
        % refc_eq
        %         curv_eq = histeq(curvature)';
        %         curv_eq = curv_eq(:);
        %         curv_eq(idx<=0) = [];
        points = [UTC, utm, refc, zeros(length(UTC),1), normals, curvature, zeros(length(UTC),1), zeros(length(UTC),1)];
        idx(idx<=0) = [];
        points(idx,6) = refc_eq(:) * 255;
        %         points(idx,end-1) = curv_eq(:);
        points(idx,end-1) = refGradM(:);
        points(idx,end) = rngGradM(:);
    end
    savePoints(points, para);
else
    % UTC x y z refc182 refc_eq nx ny nz cur edge
    points = textread([para.dir_name para.data_name '_' para.point_cloud_name], '', 'delimiter', ' ', 'headerlines',2);
end

if recompute.pcd_vis
%     savepcd([para.dir_name para.data_name '_Scan_for_MI_gradMRef.pcd'], points(:,2:4), points(:,end-1)*20);
%     savepcd([para.dir_name para.data_name '_Scan_for_MI_gradMRng.pcd'], points(:,2:4), points(:,end)*20);
%     savepcd([para.dir_name para.data_name '_Scan_for_MI_cur.pcd'], points(:,2:4), points(:,10)*1000);
    savepcd([para.dir_name para.data_name '_Scan_for_MI_refc.pcd'], points(:,2:4), points(:,5));
    %     savepcd([para.dir_name para.data_name '_Scan_for_MI_refceq.pcd'], points(:,2:4), points(:,6));
    %
%     savepcd([para.dir_name para.data_name '_Scan_for_MI_normX.pcd'], points(:,2:4), abs(points(:,7))*255);
%     savepcd([para.dir_name para.data_name '_Scan_for_MI_normY.pcd'], points(:,2:4), abs(points(:,8))*255);
%     savepcd([para.dir_name para.data_name '_Scan_for_MI_normZ.pcd'], points(:,2:4), abs(points(:,9))*255);
end
