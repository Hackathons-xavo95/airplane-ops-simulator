function [ sc ] = init_schedule( fli )
    sc = create_schedule();
    sc.operation_start_time = convert_time(fli.departure_time);
    sc.operation_stop_time = convert_time(fli.arrival_time);
    sc.flights(1) = fli;
end

