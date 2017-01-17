function [ VA_new ] = read_costs( VA, filename )
    VA_new = VA;
    [fileID, er] = fopen(filename, 'r');
    if (fileID == -1)
        disp(er);
        return;
    end
    tline = fgetl(fileID);
    n=1;
    while ischar(tline)
        if(n>1)
            [s1, rem] = strtok(tline);
            [s2, rem] = strtok(rem);
            [s3, rem] = strtok(rem);
            [s4, rem] = strtok(rem);
            [air, ind] = search_airport( VA, s1 );
            VA_new(ind) = set_costs(air, s2, s3, s4);
        end
        tline = fgetl(fileID);
        n = n + 1;
    end
    fclose(fileID);
end

