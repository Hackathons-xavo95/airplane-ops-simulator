function [ air, ind ] = search_airport( VA, name )
    % Given VA, a vector of structs Tairport, and name, the ICAO code of an airport,
    % the function searches for this airport in the vector1 and returns a copy of the airport data, air,
    % and the position in the vector where the airport was found, ind. If the code is not found then
    % air is and empty Tairport struct and ind is -1.
    [~, rows] = size(VA); % Compute the size of the Airports vector
    n = 1;
    encontrado = false;
    while(n<=rows && ~encontrado) % For a search by airport name
        if(strcmp(VA(n).id, name)) % Check if name matches
            encontrado = true;
        else
            n = n + 1;
        end
    end
    if encontrado % If match found return that airport and his index
        air = VA(n);
        ind = n;
    else % If match not found return empty airport and -1 as index
        air = create_airport();
        ind = -1;
    end
end

