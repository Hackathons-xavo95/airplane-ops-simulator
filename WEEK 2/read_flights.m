function [ VF ] = read_flights( filename )
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
            i = n - 1;
            VF(i) = init_flight(rem, s3, s4, s1, s2);
        end
        tline = fgetl(fileID);
        n = n + 1;
    end
    fclose(fileID);
end

