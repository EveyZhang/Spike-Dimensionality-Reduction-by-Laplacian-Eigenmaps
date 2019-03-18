function[mapping, neural] = buildMap(spikes)
    neural = spikes(spikes(:,3)~=0,:);
    data = neural(:,[2,3]);
    [a,b] = sort(data(:,1),1);
    data = data(b,:);
    data = [data zeros(size(data,1),1)];
    
    index = 0;
    neuron = 0;
    cla = [];
    mapping = [];
    for i = 1:size(data,1)     % i represent timestamp
        if data(i,1) == index  %  channel No.
            if ismemof(cla, data(i,2)) == 1
            else 
                neuron = neuron + 1;% neuron represent the No. of neurons 
                cla = [cla data(i,2)];
                mapping = [mapping;data(i,1) data(i,2) neuron];
            end
            
        else
            index = data(i,1); %index is channel No.
            neuron = neuron + 1;
            cla = data(i,2);   %cla is class of the signal
            mapping = [mapping;data(i,1) data(i,2) neuron];%[previous;channelNo.  class  neuron]
        end
        
    end
    
    for i = 1:size(data,1) % i represent the timestamp
        neural(i,4) = getNeuronID(mapping, neural(i,2), neural(i,3));%(No. of neurons,channel No.,class)
    end
    
end

function[neuronID] = getNeuronID(map, ch,  cla)%(No. of neurons,channel No.,class)
    for i = 1:size(map, 1) % i No. of neurons
        if map(i,1)==ch && map(i,2) == cla
            neuronID = map(i,3);
            return;
        end
    end
    
    neuronID = -1;
    
    
end

function[ret] = ismemof(set, mem) % see if mem is in the class; yes:1;no:0;
    for i = 1:size(set,2) 
        if(mem == set(1,i)) 
            ret = 1;
            return;
        end
    end
    ret = 0;
    return;
end