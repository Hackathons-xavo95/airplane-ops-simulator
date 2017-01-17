function [ minute ] = convert_time( hhmm )
    % Given a string with a time in the format HHMM (HH is the hour and MM is the
    % minute) the function converts it to minutes and returns a value between 0 and 1440 (24*60).
    % If the format is not correct then the function returns -1 and shows an error message in the
    % screen.
    if (length(hhmm) == 4) % Check if length is correct
        [~, status] = str2num(hhmm); % Check if format is correct
        if (status == 0) % If format is incorrect return -1
            minute = -1;
            disp('Bad format, please use only numbers');
        else % If format is incorrect return the hhmm string
            hours = str2num(hhmm(1:2));
            minutes = str2num(hhmm(3:4));
            minute = (hours * 60) + minutes;
        end
    else % If length is incorrect return -1
        minute = -1;
        disp('Bad format, correct one is HHMM, HH hours and MM minutes');
    end
end

