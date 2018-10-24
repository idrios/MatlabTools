function success = initWorkspace()
%INITWORKSPACE Initiates a table that allows a user to define new
%workspaces to work in
%   Creates a struct array called 'workspaces' that will be saved
%   externally and can be called upon when a user wants to continue where
%   they left off in a project without manually going to the project. 
%
%   inputs - none (inputs will be requested throughout the function script)
%   outputs - 
%       'workspaces' - a struct array with the following fields:
%           'Key' - index in the struct array
%           'Name' - name of project
%           'Path' - directory path to the project

%   James Roberts - 2/7/2017
    success = 0;

    home_dir = uigetdir('C:/Users/James/Documents','Select a folder for the project home-directory');
    if(home_dir==0) % Return if user cancels new folder dialogue
        return
    end
    name = strrep(input('Name your new project:\n>', 's'), '''', '');
    if(isempty(name)) % Return if user cancels name-folder dialogue or hit enter without giving a value
        return
    end
    
    workspaces = struct('Key', '1', 'Name', name, 'Path', home_dir);
    
    %% Mark Complete
    fprintf('Creating %s... ', name);
    save('workspaces', 'workspaces');
    fprintf('done!\n');
    
    cd(home_dir)
    success = 1;
end
