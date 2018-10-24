function success = remWorkspace(workspaces, remIndex)
%REMOVEPROJECT Summary of this function goes here
%   Detailed explanation goes here
    success = 0; 
    if(remIndex > length(workspaces))
        return
    end
    if(remIndex < length(workspaces))
        for i = remIndex:length(workspaces)-1
            workspaces(i) = workspaces(i+1);
            workspaces(i).Key = num2str(i);
        end
    end
    workspaces = workspaces(1:end-1);
    
    %% Mark Complete
    save('workspaces', 'workspaces');
    
    success = 1;

end

