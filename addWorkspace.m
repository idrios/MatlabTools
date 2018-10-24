function success = addWorkspace(workspaces)
%ADDPROJECT Summary of this function goes here
%   Detailed explanation goes here
    
    success = 0; 

    home_dir = uigetdir('C:/Users/James/Documents','Select a folder for the project home-directory');
    if(home_dir==0) % Return if user cancels new folder dialogue
        return
    end
    name = strrep(input('Name your new project:\n>', 's'), '''', '');
    if(isempty(name)) % Return if user cancels name-folder dialogue or hit enter without giving a value
        return
    end

    len = length(workspaces);
    workspaces(len+1).Key = num2str(len+1);
    workspaces(len+1).Name = name;
    workspaces(len+1).Path = home_dir;
    
    %% Mark Complete
    fprintf('Creating %s... ', name);
    save('workspaces', 'workspaces');
    fprintf('done!\n');
    
    cd(home_dir)
    success = 1;

end

