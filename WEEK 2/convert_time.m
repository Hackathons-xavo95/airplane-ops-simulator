function [ minute ] = convert_time( hhmm )
    if (length(hhmm) == 4)
        [~, status] = str2num(hhmm);
        if (status == 0)
            minute = -1;
            disp('Bad format, please use only numbers');
        else
            hours = str2num(hhmm(1:2));
            minutes = str2num(hhmm(3:4));
            minute = (hours * 60) + minutes;
        end
    else
        minute = -1;
        disp('Bad format, correct one is HHMM, HH hours and MM minutes');
    end
end

