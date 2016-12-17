function [feat_rois] = fast_rcnn_map_im_rois_to_feat_rois(conf, im_rois, im_scale_factor)
% [feat_rois] = fast_rcnn_map_im_rois_to_feat_rois(conf, im_rois, im_scale_factor)
% --------------------------------------------------------
% Fast R-CNN
% Reimplementation based on Python Fast R-CNN (https://github.com/rbgirshick/fast-rcnn)
% Copyright (c) 2015, Shaoqing Ren
% Licensed under The MIT License [see LICENSE for details]
% --------------------------------------------------------

%% Map a ROI in image-pixel coordinates to a ROI in feature coordinates.
% in matlab's index (start from 1)
if size(im_scale_factor, 1) == 1
    im_scale_factor = repmat(im_scale_factor, size(im_rois,1), 1);
else
    assert(size(im_scale_factor, 1) == size(im_rois, 1)); 
end
if size(im_scale_factor, 2) == 1
    feat_rois = round(bsxfun(@times, (im_rois-1), im_scale_factor)) + 1;
elseif size(im_scale_factor, 2) == 2
    feat_rois = round((im_rois-1) .* im_scale_factor(:,[2 1 2 1]) ) + 1;
end

end