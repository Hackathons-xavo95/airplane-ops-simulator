function [ air ] = init_airport( s1, s2, s3 )
    % Returns a Tairport struct using the 3 strings entered as parameter to initialize
    % the 3 fields of the struct. Call the previous function inside this one to create first an empty
    % struct and then initialize it with the parameters.
    air = create_airport();
    air.id = s1;
    air.coordinates = s2;
    air.description = s3;
end

