function [ fli ] = create_flight()
    % Returns an empty Tflight struct
    Tflight = struct('type','','departure','','arrival','','departure_time','','arrival_time','','delay',0);
    fli = Tflight; % Set fli to empty Tflight struct
end