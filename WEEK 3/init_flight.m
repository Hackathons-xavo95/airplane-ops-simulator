function [ fli ] = init_flight( s1, s2, s3, s4, s5 )
    fli = create_flight();
    fli.type = s1;
    fli.departure = s2;
    fli.arrival = s3;
    fli.departure_time = s4;
    fli.arrival_time = s5;
end
