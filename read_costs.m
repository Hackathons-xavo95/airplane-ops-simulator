function [ VA_new ] = read_costs( VA, filename )
    % Given a vector VA of structs of type Tairport and the name of a file with
    % airports costs, cost_file, with the format and content shown in Annex E, this function
    % updates the information of the vector of airports with their costs. Use the previous function
    % inside this one, as well as the function search_airport from Week 1. If the file does not exist
    % or has a erroneous format, then function returns a copy of the input vector and shows an
    % error message in the screen.
    VA_new = VA;
    [fileID, er] = fopen(filename, 'r'); % Open filename with read permissions
    if (fileID == -1) % Check if er opened the file correctly
        disp(er);
        VA_new = create_airport();
        return;
    end
    tline = fgetl(fileID); % Get the current line
    n=1;
    while ischar(tline) % If the current line is not null proceed
        if(n>1)
            [s1, rem] = strtok(tline); % Get ICAN name
            [s2, rem] = strtok(rem); % Get runaway costs
            [s3, rem] = strtok(rem); % Get free parking hours
            [s4, rem] = strtok(rem); % Get parking costs per hour
            [air, ind] = search_airport( VA, s1 ); % Find the airport by ICAN name
            VA_new(ind) = set_costs(air, s2, s3, s4); % Set the costs to the correct airport
        end
        tline = fgetl(fileID); % Get the next line
        n = n + 1;
    end
    fclose(fileID); % Close the file
end

