function [ VA ] = read_airports( filename )
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
            i = n - 1;
            VA(i) = init_airport(s1, s2, s3);
        end
        tline = fgetl(fileID);
        n = n + 1;
    end
    fclose(fileID);
end

