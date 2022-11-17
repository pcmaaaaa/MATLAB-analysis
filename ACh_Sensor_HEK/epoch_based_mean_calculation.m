% This script is used to calculate the EC50 from the dose dependent
% response experiments.

%% 
% Use the first epoch, average of 10 acqns before flow in anything as the baseline, 
% Use the max response from each epoch as the response of the corresponding epoch.
% Normalize the response of each cell, baseline as 0 and max response as 1.



%% use the average of from acq 20 after the start of a epoch till end of the epoch as the response of the drug epoch
drug_epochs = [2 3 4 5 6 7]
epoch_response_intensity1 = zeros(length(drug_epochs),size(intensity1, 2));
epoch_response_lft1 = zeros(length(drug_epochs),size(lft1,2));
baseline_start_intensity1 = zeros(1, size(intensity1,2));
baseline_start_lft1 = zeros(1, size(lft1,2));

drug_epoch_start_acq1 = EpochStartAcq1(drug_epochs-1);

for i = 1:size(intensity1, 2)
    baseline_start_intensity1(i) = mean(intensity1(drug_epoch_start_acq1(1):drug_epoch_start_acq1(1)+10, i));
    baseline_start_lft1(i) = mean(lft1(drug_epoch_start_acq1(1):drug_epoch_start_acq1(1)+10, i));
end

for i = 1:size(intensity1, 2)
    for j = 1:length(drug_epochs)-1
    epoch_response_intensity1(j,i) = mean(intensity1((drug_epoch_start_acq1(j)+20):(drug_epoch_start_acq1(j+1)-1),i));
    epoch_response_lft1(j,i) = mean(lft1((drug_epoch_start_acq1(j)+20):(drug_epoch_start_acq1(j+1)-1),i));
    end
end

epoch_response_intensity_norm1 = (epoch_response_intensity1 - baseline_start_intensity1)/baseline_start_intensity1;
epoch_response_lft_norm1 = epoch_response_lft1 - baseline_start_lft1;


%% use the average of acq 10-20 after the start of a epoch as the response of the drug epoch
drug_epochs = [2 3 4 5 6 7]
epoch_response_intensity2 = zeros(length(drug_epochs),size(intensity2, 2));
epoch_response_lft2 = zeros(length(drug_epochs),size(lft2,2));
baseline_start_intensity2 = zeros(1, size(intensity2,2));
baseline_start_lft2 = zeros(1, size(lft2,2));


drug_epoch_start_acq2 = EpochStartAcq2(drug_epochs-1);

for i = 1:size(intensity2, 2)
    baseline_start_intensity2(i) = mean(intensity2(drug_epoch_start_acq2(1):drug_epoch_start_acq2(1)+10, i));
    baseline_start_lft2(i) = mean(lft2(drug_epoch_start_acq2(1):drug_epoch_start_acq2(1)+10, i));
end


for i = 1:size(intensity2, 2)
    for j = 1:length(drug_epochs)-1
    epoch_response_intensity2(j,i) = mean(intensity2((drug_epoch_start_acq2(j)+20):(drug_epoch_start_acq2(j+1)-1),i));
    epoch_response_lft2(j,i) = mean(lft2((drug_epoch_start_acq2(j)+20):(drug_epoch_start_acq2(j+1)-1),i));
    end
end

epoch_response_intensity_norm2 = (epoch_response_intensity2 - baseline_start_intensity2)/baseline_start_intensity2;
epoch_response_lft_norm2 = epoch_response_lft2 - baseline_start_lft2;

%%
drug_epochs = [2 3 4 5 6 7]
epoch_response_intensity3 = zeros(length(drug_epochs),size(intensity3, 2));
epoch_response_lft3 = zeros(length(drug_epochs),size(lft3,2));
baseline_start_intensity3 = zeros(1, size(intensity3,2));
baseline_start_lft3 = zeros(1, size(lft3,2));


drug_epoch_start_acq3 = EpochStartAcq3(drug_epochs-1);

for i = 1:size(intensity3, 2)
    baseline_start_intensity3(i) = mean(intensity3(drug_epoch_start_acq3(1):drug_epoch_start_acq3(1)+10, i));
    baseline_start_lft3(i) = mean(lft3(drug_epoch_start_acq3(1):drug_epoch_start_acq3(1)+10, i));
end


for i = 1:size(intensity3, 2)
    for j = 1:length(drug_epochs)-1
    epoch_response_intensity3(j,i) = mean(intensity3((drug_epoch_start_acq3(j)+20):(drug_epoch_start_acq3(j+1)-1),i));
    epoch_response_lft3(j,i) = mean(lft3((drug_epoch_start_acq3(j)+20):(drug_epoch_start_acq3(j+1)-1),i));
    end
end

epoch_response_intensity_norm3 = (epoch_response_intensity3 - baseline_start_intensity3)/baseline_start_intensity3;
epoch_response_lft_norm3 = epoch_response_lft3 - baseline_start_lft3;