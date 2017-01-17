function [ sc ] = create_schedule()
    Tflight = struct('type','','departure','','arrival','','departure_time','','arrival_time','');
    Tschedule = struct('operation_start_time',0,'operation_stop_time',0,'flights',Tflight);
    sc = Tschedule;
end