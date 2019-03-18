function bin_mov=binMark_SO(Mark,time_start,t_shift,sampleR,bin_cut)

mov=diff(Mark(:,[6,7,8,13]));
mov(:,5)=Mark(2:end,1);

bin_mark.start=0;
bin_mark.cue='';
bin_mark.cue_time=0;
bin_mark.go=0;
bin_mark.end=0;

j=1;
for i=1:size(mov,1)
    if mov(i,4)==1
        bin_mark.start=ceil((mov(i,5)-time_start)/(t_shift*sampleR))-bin_cut;
        if bin_mark.start<0
            bin_mark.start=0;
        end
    end
    if mov(i,2)==1&&bin_mark.start>0
        bin_mark.cue='Power';
        bin_mark.cue_time=ceil((mov(i,5)-time_start)/(t_shift*sampleR))-bin_cut;
    end
    if mov(i,1)==1&&bin_mark.start>0
        bin_mark.cue='Hook';
        bin_mark.cue_time=ceil((mov(i,5)-time_start)/(t_shift*sampleR))-bin_cut;
    end
    if mov(i,3)==1
        if bin_mark.start>0&&bin_mark.cue_time>0
            bin_mark.go=ceil((mov(i,5)-time_start)/(t_shift*sampleR))-bin_cut;
        elseif bin_mark.start>0&&bin_mark.cue_time==0
            bin_mark.start=0;
        end
    end
    if mov(i,3)==-1
        if bin_mark.start>0&&bin_mark.cue_time>0&&bin_mark.go>0
            bin_mark.end=ceil((mov(i,5)-time_start)/(t_shift*sampleR))-bin_cut;
            bin_mov(j)=bin_mark;
            j=j+1;
            bin_mark.start=0;
            bin_mark.cue='';
            bin_mark.cue_time=0;
            bin_mark.go=0;
            bin_mark.end=0;
        else
            bin_mark.start=0;
            bin_mark.cue='';
            bin_mark.cue_time=0;
            bin_mark.go=0;
        end
    end

end