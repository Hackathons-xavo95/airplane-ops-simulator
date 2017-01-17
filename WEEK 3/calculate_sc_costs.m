function [ VC ] = calculate_sc_costs( sc, VA )
    [~, rows] = size(sc.flights);
    n = 1;
    VC = zeros(1,rows + 1); 
    while(n<=rows)
        if(n == 1)
            [air, ~] = search_airport( VA, sc.flights(n).departure);
            parking = str2num(air.cost_parking_hours);
            delta = (convert_time(sc.flights(n).departure_time) - 180)/60;
            VC(n) = parking * delta;
        else
            [air, ~] = search_airport( VA, sc.flights(n).departure);
            VC(n) = str2num(air.runaway_cost);
            parking = str2num(air.cost_parking_hours);
            delta_parking_dirty = (convert_time(sc.flights(n).departure_time) - convert_time(sc.flights(n - 1).arrival_time));
            delta_parking_net = (delta_parking_dirty/60) - str2num(air.free_parking_hours);
            if(delta_parking_net > 0)
                VC(n) = VC(n) + (parking * delta_parking_net);
            end
        end
        n = n + 1;
    end
    n = n - 1;
    [air, ~] = search_airport( VA, sc.flights(n).arrival);
    VC(n + 1) = str2num(air.runaway_cost);
    parking = str2num(air.cost_parking_hours);
    delta_parking_dirty = (1440 - convert_time(sc.flights(n).arrival_time));
    delta_parking_net = (delta_parking_dirty/60) - str2num(air.free_parking_hours);
    departure_time = convert_time(sc.flights(n).departure_time);
    arrival_time = convert_time(sc.flights(n).arrival_time);
    if((delta_parking_net > 0) && (arrival_time > departure_time))
    	VC(n + 1) = VC(n + 1) + (parking * delta_parking_net);
    end
end

