function [ VF ] = read_flights( filename )
    % Given a filename of a file containing the list of flight of one day using the
    % format given in appendix D the function returns a vector of Tflight structs, each
    % initialized with the data of one of the flights in the file. Use the previous
    % function inside this one. If the file does not exist the function return an empty 
    % vector and shows an error message in the screen.
    [fileID, er] = fopen(filename, 'r'); % Open filename with read permissions
    if (fileID == -1) % Check if er opened the file correctly
        disp(er);
        VF = create_flight();
        return;
    end
    tline = fgetl(fileID); % Get the current line
    n=1;
    while ischar(tline) % If the current line is not null proceed
        if(n>1)
            [s1, rem] = strtok(tline); % Get departure_time
            [s2, rem] = strtok(rem); % Get arrival_time
            [s3, rem] = strtok(rem); % Get departure ICAN name
            [s4, rem] = strtok(rem); % Get arrival ICAN name
            [s5, rem] = strtok(rem); % Get aircraft type
            i = n - 1;
            VF(i) = init_flight(s5, s3, s4, s1, s2); % Init the new flight with the given parameters
        end
        tline = fgetl(fileID); % Get the next line
        n = n + 1;
    end
    fclose(fileID); % Close the file
end

