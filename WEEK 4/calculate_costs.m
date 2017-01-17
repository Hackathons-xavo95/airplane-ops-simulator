function [ A_mod ] = calculate_costs( A, VA )
    % Given the airline data of A and a vector VA with the updated airports costs,
    % this function calculates and return in A_mod the new airline with the total costs for the
    % airline in airport services in one day. Use calculat_sc_costs inside this function.
    A_mod = A;
    [~, rows] = size(A.fleet); % Compute the size of the Airline fleet
    n = 1;
    while(n<=rows) % Iterate on Airline fleets
        VC = calculate_sc_costs(A.fleet(n), VA); % Calculate the costs of the selected schedule
                                                 % with the costs on the airline vector
        [~, rows_VC] = size(VC); % Compute the size of the Costs vector
        o = 1;
        while(o<=rows_VC) % Iterate on costs vector
            A_mod.total_costs = A_mod.total_costs + VC(o); % Increment the airline total costs
            o = o + 1;
        end
        n = n + 1;
    end
end

