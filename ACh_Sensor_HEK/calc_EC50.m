% This script is used to calculate the EC50 from the dose dependent
% response experiments.


%% use the average of acq 20-30 after the start of a epoch as the response of the drug epoch
drug_epochs = [2 4 6 8 10 12 14 16 18 20 22]
epoch_response_intensity = zeros(length(drug_epochs),5);
epoch_response_lft = zeros(length(drug_epochs),5);

drug_epoch_start_acq = EpochStartAcq(drug_epochs-1);

for i = 1:5
    for j = 1:length(drug_epochs)
    epoch_response_intensity(j,i) = mean(intensity((drug_epoch_start_acq(j)+20):(drug_epoch_start_acq(j)+30),i));
    epoch_response_lft(j,i) = mean(lft((drug_epoch_start_acq(j)+20):(drug_epoch_start_acq(j)+30),i));
    end
end

%% Continue from last section, normalize the response across cells, baseline as 0 and max response as 1
epoch_response_intensity_norm = zeros(length(drug_epochs),5);
epoch_response_lft_norm = zeros(length(drug_epochs),5);
for i = 1:5
    baseline_intensity = epoch_response_intensity(1,i);
    max_response_intensity = max(epoch_response_intensity(:,i));
    epoch_response_intensity_norm(:,i) = (epoch_response_intensity(:,i) - baseline_intensity)/(max_response_intensity - baseline_intensity);
    
    baseline_lft = epoch_response_lft(1,i);
    max_response_lft = max(epoch_response_lft(:,i));
    epoch_response_lft_norm(:,i) = (epoch_response_lft(:,i) - baseline_lft)/(max_response_lft - baseline_lft);
end

%% Normalize the response trace of each cell
intensity_norm = zeros(size(intensity,1),5);
lft_norm = zeros(size(lft,1),5);

for i = 1:5
    baseline_intensity = epoch_response_intensity(1,i);
    max_response_intensity = max(epoch_response_intensity(:,i));
    intensity_norm(:,i) = (intensity(:,i) - baseline_intensity)/(max_response_intensity - baseline_intensity);
    
    baseline_lft = epoch_response_lft(1,i);
    max_response_lft = max(epoch_response_lft(:,i));
    lft_norm(:,i) = (lft(:,i) - baseline_lft)/(max_response_lft - baseline_lft);
end