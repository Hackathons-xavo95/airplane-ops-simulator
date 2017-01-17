function [ VC ] = calculate_sc_costs( sc, VA )
    % Given a schedule of an aircraft sc and a vector VA with the airports costs, this
    % function calculates and returns in VC the vector of the costs that the aircraft has to pay to
    % the different airports for their services in one day. Before the first take-off of the day only
    % the parking time from 3am shall be paid. Use search_airport from week 1 in this function.
    [~, rows] = size(sc.flights); % Compute the size of the schedule flights
    n = 1;
    VC = zeros(1,rows + 1); % Preallocate the costs vector
    while(n<=rows)  % Iterate on schedule flights
        if(n == 1) % If is the first we only have to pay parking since 3 am
            [air, ~] = search_airport( VA, sc.flights(n).departure); % Get the airport struct
            parking = str2num(air.cost_parking_hours); % Get the cost per parking hour
            delta = (convert_time(sc.flights(n).departure_time) - 180)/60; % Get parking time in hours
            VC(n) = parking * delta; % Calculate the costs of parking * hours
        else
            [air, ~] = search_airport( VA, sc.flights(n).departure); % Get the airport struct
            VC(n) = str2num(air.runaway_cost); % Set costs to runaway fee
            parking = str2num(air.cost_parking_hours); % Get the cost per parking hour
            % Calculate the time that the aircraft have been on parking
            delta_parking_dirty = (convert_time(sc.flights(n).departure_time) - convert_time(sc.flights(n - 1).arrival_time));
            % Get parking time in hours minus the free hours
            delta_parking_net = (delta_parking_dirty/60) - str2num(air.free_parking_hours);
            if(delta_parking_net > 0) % If we have stayed more than free time included
                VC(n) = VC(n) + (parking * delta_parking_net); % Increment the costs with parking * hours
            end
        end
        n = n + 1;
    end
    n = n - 1; % Add final costs
    [air, ~] = search_airport( VA, sc.flights(n).arrival); % Get the airport struct
    VC(n + 1) = str2num(air.runaway_cost); % Set costs to runaway fee
    parking = str2num(air.cost_parking_hours); % Get the cost per parking hour
    % Calculate the time that the aircraft will be on parking till the end
    % of the day
    delta_parking_dirty = (1440 - convert_time(sc.flights(n).arrival_time));
    % Get parking time in hours minus the free hours
    delta_parking_net = (delta_parking_dirty/60) - str2num(air.free_parking_hours);
    % Calculate last departure and arrival times
    departure_time = convert_time(sc.flights(n).departure_time);
    arrival_time = convert_time(sc.flights(n).arrival_time);
    % If we have stayed more than free time included or arrived past 00:00
    if((delta_parking_net > 0) && (arrival_time > departure_time))
    	VC(n + 1) = VC(n + 1) + (parking * delta_parking_net); % Increment the costs with parking * hours
    end
end

