function [ air_new ] = set_costs( air, crw, nfh, cph )
    air_new = air;
    air_new.runaway_cost = crw;
    air_new.free_parking_hours = nfh;
    air_new.cost_parking_hours = cph;
end

