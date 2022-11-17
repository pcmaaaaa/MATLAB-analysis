intensity_change_baseline = intensity_baseline_increase_all(:,2)./intensity_baseline_increase_all(:,1);
intensity_change1 = intensity_baseline_increase_all(:,3)./intensity_baseline_increase_all(:,1);
intensity_change2 = intensity_baseline_increase_all(:,4)./intensity_baseline_increase_all(:,1);
intensity_change3 = intensity_baseline_increase_all(:,5)./intensity_baseline_increase_all(:,1);
intensity_change4 = intensity_baseline_increase_all(:,6)./intensity_baseline_increase_all(:,1);

intensity_foldchange_all = [intensity_change_baseline intensity_change1 intensity_change2 intensity_change3 intensity_change4]