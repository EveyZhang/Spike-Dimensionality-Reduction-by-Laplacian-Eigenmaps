function bin_mov=binMark_TT(Mark,time_start,t_shift,sampleR,bin_cut)

mov=diff(Mark(:,[2,3,4,7,8,9,10]));
mov(:,8)=Mark(2:end,1);

bin_mark.start=0;
bin_mark.obj='';
bin_mark.light_time=0;
bin_mark.go=0;
bin_mark.end=0;

j=1;
for i=1:size(mov,1)
    if mov(i,7)==1
        bin_mark.start=ceil((mov(i,8)-time_start)/(t_shift*sampleR))-bin_cut;
        if bin_mark.start<0
            bin_mark.start=0;
        end
    end
    if mov(i,5)==1&&bin_mark.start>0       
        bin_mark.light_time=ceil((mov(i,8)-time_start)/(t_shift*sampleR))-bin_cut;
    end

    if mov(i,6)==1
        if bin_mark.start>0&&bin_mark.light_time>0
            bin_mark.go=ceil((mov(i,8)-time_start)/(t_shift*sampleR))-bin_cut;
        elseif bin_mark.start>0&&bin_mark.cue_time==0
            bin_mark.start=0;
        end
    end
    
    if mov(i,1)==1&&bin_mark.start>0&&bin_mark.light_time>0&&bin_mark.go>0
        bin_mark.obj='Handle';
    end
    if mov(i,2)==1&&bin_mark.start>0&&bin_mark.light_time>0&&bin_mark.go>0
        bin_mark.obj='Cube';
    end
    if mov(i,3)==1&&bin_mark.start>0&&bin_mark.light_time>0&&bin_mark.go>0
        bin_mark.obj='Plate';
    end
    if mov(i,4)==1&&bin_mark.start>0&&bin_mark.light_time>0&&bin_mark.go>0
        bin_mark.obj='Ring';
    end
    
    if mov(i,6)==-1
        if bin_mark.start>0&&bin_mark.light_time>0&&bin_mark.go>0&&~isempty(bin_mark.obj)
            bin_mark.end=ceil((mov(i,8)-time_start)/(t_shift*sampleR))-bin_cut;
            bin_mov(j)=bin_mark;
            j=j+1;
            bin_mark.start=0;
            bin_mark.obj='';
            bin_mark.light_time=0;
            bin_mark.go=0;
            bin_mark.end=0;
        else
            bin_mark.start=0;
            bin_mark.obj='';
            bin_mark.light_time=0;
            bin_mark.go=0;
        end
    end

end