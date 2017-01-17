function [ sc ] = add_schedule( sc_old, fli )
    sc = sc_old;
    [~, rows] = size(sc_old.flights);
    if(sc_old.operation_start_time == 0 && sc_old.operation_stop_time == 0)
        sc.flights(rows) = fli;
    else
        sc.flights(rows + 1) = fli;
    end
    if(sc_old.operation_start_time > convert_time(fli.departure_time) || sc_old.operation_start_time == 0)
        sc.operation_start_time = convert_time(fli.departure_time);
    end
    if(sc_old.operation_stop_time < convert_time(fli.arrival_time))
    	sc.operation_stop_time = convert_time(fli.arrival_time);
    end  
end