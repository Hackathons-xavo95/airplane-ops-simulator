function [ air ] = init_airport( s1, s2, s3 )
    air = create_airport();
    air.id = s1;
    air.coordinates = s2;
    air.description = s3;
end

