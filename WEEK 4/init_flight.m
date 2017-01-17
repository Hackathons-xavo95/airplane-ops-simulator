function [ fli ] = init_flight( s1, s2, s3, s4, s5 )
    % Returns a Tflight struct using the 5 strings entered as parameter to initialize the
    % 5 fields of the struct. Call the previous function inside this one to create first an empty struct
    % and then initialize it with the parameters.
    fli = create_flight();
    fli.type = s1;
    fli.departure = s2;
    fli.arrival = s3;
    fli.departure_time = s4;
    fli.arrival_time = s5;
end
