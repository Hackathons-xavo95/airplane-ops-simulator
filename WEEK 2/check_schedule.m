function [ check ] = check_schedule( sc1, fli )
    if(sc1.operation_start_time == 0 && sc1.operation_stop_time == 0)
        check = true;
    else
        [~, rows] = size(sc1.flights);
        if(strcmp(sc1.flights(rows).arrival, fli.departure)  && strcmp(sc1.flights(rows).type, fli.type))
            if(convert_time(fli.departure_time) > sc1.operation_stop_time + 60)
                check = true;
            else
                check = false;
            end
        else
            check = false;
        end
    end
end

