function [ A ] = create_airline( num_aircraft )
    Tflight = struct('type','','departure','','arrival','','departure_time','','arrival_time','');
    Tschedule = struct('operation_start_time',0,'operation_stop_time',0,'flights',Tflight);
    Tairline = struct('name','','fleet',Tschedule, 'total_costs',0);
    A = Tairline;
    A.name = 'JTG';
    n = 1;
    while(n<=num_aircraft)
        A.fleet(n) = Tschedule;
        n = n + 1;
    end
end

