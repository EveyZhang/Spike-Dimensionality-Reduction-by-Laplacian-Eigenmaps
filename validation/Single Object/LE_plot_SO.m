function LE_plot_SO(mappedX,bin_mov)
xmin=min(mappedX(1,:));
xmax=max(mappedX(1,:));
ymin=min(mappedX(2,:));
ymax=max(mappedX(2,:));
zmin=min(mappedX(3,:));
zmax=max(mappedX(3,:));
figure(1);
hold on;
axis([xmin,xmax,ymin,ymax,zmin,zmax]);
title('Laplacian Eigenmaps','FontSize',28);
set(gca,'FontSize',22)
view(-135,20)
start=1;


for i=1:size(bin_mov,2)
    if strcmp(bin_mov(i).cue,'Power')
        p_time_wait=start:bin_mov(i).cue_time;
        p_time_prepare=bin_mov(i).cue_time:bin_mov(i).go;
        p_time_execution=bin_mov(i).go:bin_mov(i).end;
        start=bin_mov(i).end;  
        p_p1=plot3(mappedX(1,p_time_wait),mappedX(2,p_time_wait),mappedX(3,p_time_wait),'m-');
        p_d1=plot3(mappedX(1,p_time_wait(end)),mappedX(2,p_time_wait(end)),mappedX(3,p_time_wait(end)),'mo','MarkerSize',12);
        p_p2=plot3(mappedX(1,p_time_prepare),mappedX(2,p_time_prepare),mappedX(3,p_time_prepare),'r-');
        p_d2=plot3(mappedX(1,p_time_prepare(end)),mappedX(2,p_time_prepare(end)),mappedX(3,p_time_prepare(end)),'r*','MarkerSize',15);
        p_p3=plot3(mappedX(1,p_time_execution),mappedX(2,p_time_execution),mappedX(3,p_time_execution),'y-');
    end
    if strcmp(bin_mov(i).cue,'Hook')
        h_time_wait=start:bin_mov(i).cue_time;
        h_time_prepare=bin_mov(i).cue_time:bin_mov(i).go;
        h_time_execution=bin_mov(i).go:bin_mov(i).end;
        start=bin_mov(i).end;  
        h_p1=plot3(mappedX(1,h_time_wait),mappedX(2,h_time_wait),mappedX(3,h_time_wait),'k-');
        h_d1=plot3(mappedX(1,h_time_wait(end)),mappedX(2,h_time_wait(end)),mappedX(3,h_time_wait(end)),'ko','MarkerSize',12);
        h_p2=plot3(mappedX(1,h_time_prepare),mappedX(2,h_time_prepare),mappedX(3,h_time_prepare),'b-');
        h_d2=plot3(mappedX(1,h_time_prepare(end)),mappedX(2,h_time_prepare(end)),mappedX(3,h_time_prepare(end)),'b*','MarkerSize',15);
        h_p3=plot3(mappedX(1,h_time_execution),mappedX(2,h_time_execution),mappedX(3,h_time_execution),'g-');
    end
end