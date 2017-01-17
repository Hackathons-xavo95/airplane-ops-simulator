function [ air_new ] = set_costs( air, crw, nfh, cph )
    % Given a struct air of type Tairport and three numerical values containing the
    % cost of the runway, crw, the number of free hours, nfh, and the cost per hour, cph, create
    % and return a new struct air_new of type Tairport with the airport costs included.
    air_new = air;
    air_new.runaway_cost = crw;
    air_new.free_parking_hours = nfh;
    air_new.cost_parking_hours = cph;
end

