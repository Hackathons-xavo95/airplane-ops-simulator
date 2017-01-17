function [ VA ] = read_airports( filename )
    % Given a filename of a file containing the information of a list of airports using
    % the format given in Annex B, the function returns a vector of Tairport’s, each initialized with
    % the data of one of the airports in the file. Use the previous function inside this one. If the file
    % does not exist the function returns an empty vector and shows an error message in the
    % screen.
    [fileID, er] = fopen(filename, 'r'); % Open filename with read permissions
    if (fileID == -1) % Check if er opened the file correctly
        disp(er);
        VA = create_airport();
        return;
    end
    tline = fgetl(fileID); % Get the current line
    n=1;
    while ischar(tline) % If the current line is not null proceed
        if(n>1)
            [s1, rem] = strtok(tline); % Get ICAN name
            [s2, rem] = strtok(rem); % Get the location
            [s3, rem] = strtok(rem); % Get the description
            i = n - 1;
            VA(i) = init_airport(s1, s2, s3); % Init the new airport with the given parameters
        end
        tline = fgetl(fileID); % Get the next line
        n = n + 1;
    end
    fclose(fileID); % Close the file
end

