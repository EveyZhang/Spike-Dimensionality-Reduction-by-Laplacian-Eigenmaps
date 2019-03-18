function LE_plot_TT(mappedX,bin_mov)
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
    if strcmp(bin_mov(i).obj,'Handle')
        if i<120
            time1=start:bin_mov(i+1).start;
            t2=bin_mov(i).light_time;
            t3=bin_mov(i).go;       
            start=bin_mov(i+1).start;  
        else
            time1=start:bin_mov(i).end;
            t2=bin_mov(i).light_time;
            t3=bin_mov(i).go;
        end
        p1=plot3(mappedX(1,time1),mappedX(2,time1),mappedX(3,time1),'k');
        p1=plot3(mappedX(1,t2),mappedX(2,t2),mappedX(3,t2),'ko','MarkerSize',15);
        p1=plot3(mappedX(1,t3),mappedX(2,t3),mappedX(3,t3),'k*','MarkerSize',15);

    end
    if strcmp(bin_mov(i).obj,'Cube')
        if i<120
            time2=start:bin_mov(i+1).start;
            t2=bin_mov(i).light_time;
            t3=bin_mov(i).go;       
            start=bin_mov(i+1).start;  
        else
            time2=start:bin_mov(i).end;
            t2=bin_mov(i).light_time;
            t3=bin_mov(i).go;
        end 
        
        p2=plot3(mappedX(1,time2),mappedX(2,time2),mappedX(3,time2),'r');
        p2=plot3(mappedX(1,t2),mappedX(2,t2),mappedX(3,t2),'ro','MarkerSize',15);
        p2=plot3(mappedX(1,t3),mappedX(2,t3),mappedX(3,t3),'r*','MarkerSize',15);

    end
    if strcmp(bin_mov(i).obj,'Plate')
        if i<120
            time3=start:bin_mov(i+1).start;
            t2=bin_mov(i).light_time;
            t3=bin_mov(i).go;       
            start=bin_mov(i+1).start;  
        else
            time3=start:bin_mov(i).end;
            t2=bin_mov(i).light_time;
            t3=bin_mov(i).go;
        end
        
        p3=plot3(mappedX(1,time3),mappedX(2,time3),mappedX(3,time3),'b');
        p3=plot3(mappedX(1,t2),mappedX(2,t2),mappedX(3,t2),'bo','MarkerSize',15);
        p3=plot3(mappedX(1,t3),mappedX(2,t3),mappedX(3,t3),'b*','MarkerSize',15);

    end
    if strcmp(bin_mov(i).obj,'Ring')
        if i<120
            time6=start:bin_mov(i+1).start;
            t2=bin_mov(i).light_time;
            t3=bin_mov(i).go;       
            start=bin_mov(i+1).start;  
        else
            time6=start:bin_mov(i).end;
            t2=bin_mov(i).light_time;
            t3=bin_mov(i).go;
        end  
        
        p6=plot3(mappedX(1,time6),mappedX(2,time6),mappedX(3,time6),'g');
        p6=plot3(mappedX(1,t2),mappedX(2,t2),mappedX(3,t2),'go','MarkerSize',15);
        p6=plot3(mappedX(1,t3),mappedX(2,t3),mappedX(3,t3),'g*','MarkerSize',15);

    end
end