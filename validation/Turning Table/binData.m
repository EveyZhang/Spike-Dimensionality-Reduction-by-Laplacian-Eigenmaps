function S=binData(neural,mapping,t_bin,t_shift,sampleR,bin_cut)
% Here just shows the method of converting the Spike file into 
% the S matrix by the spike count algorithm.In the paper, We further
% denoised the Spike data and removed redundant information.


time_start=neural(1,1);
bin_num=floor((neural(end,1)-neural(1,1))/(t_shift*sampleR)); 
S= zeros(size(mapping,1),bin_num);

for i=bin_cut:bin_num
    bin_start=i*(t_shift*sampleR)+time_start-(t_bin*sampleR);
    bin_end=i*(t_shift*sampleR)+time_start-1;
    spk_i=find(neural(:,1)>=bin_start,1);
    
    while spk_i < size(neural,1) && neural(spk_i,1) < bin_end
        S(neural(spk_i, 4), i) = S(neural(spk_i, 4), i) + 1;  
        spk_i = spk_i + 1;
    end   
end

S(:,1:bin_cut)='';