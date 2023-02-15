% revise the ROI selection based on StateYao
masks = stateYao.images.I_ROI_stack;
results = stateYao.Results;
Yao_GUI_ReviseROIsBasedOnCoordinates
masks2 = stateYao.images.I_ROI_stack;


% re-calculate the intensity and lifetime based on the new masks for the
% ROIs. 
% intensity_all and lifetime_all will include the raw intensity and
% lifetime values calculated from the new revised ROIs, from each cells of each cycle positions

intensity_all = {};
lifetime_all = {};

for i = 1:size(stateYao.AcqTime, 2) % cycle position number
    intensity = zeros(size(stateYao.ROI{i},1), size(stateYao.ROI{i}{1},2));
    lifetime = zeros(size(stateYao.ROI{i},1), size(stateYao.ROI{i}{1},2));
    for j = 1:size(stateYao.ROI{i}{1},2) % roi number
        for k = 1:size(stateYao.ROI{i},1) % acq number
            rgbLifetimes = stateYao.images.origData.rgbLifetimes{i}(:,:,:,k);
            lifetimeMaps = stateYao.images.origData.lifetimeMaps{i}(:,:,k);
            projects = stateYao.images.origData.projects{i}(:,:,k);

            try
                orig_mask1 = logical(masks{i}{k}(:,:,j));
                orig_mask2 = logical(masks2{i}{k}(:,:,j));
                intensity(k, j) = Yao_calc_Projection(projects, orig_mask2);
                lifetime(k, j) = Yao_calc_Lifetime(projects, lifetimeMaps, orig_mask2);
            catch
                warning(['cycle ', num2str(i), ' , cell ', num2str(j), ' , acq ', num2str(k), ' is epmty'])
            end

            
        end
    end

    intensity_all{i} = intensity;
    lifetime_all{i} = lifetime;
end