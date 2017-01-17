function plot_airline( A )
    % Given an airline schedule A, this function shows a plot with all the flights
    % schedule.
    % Over an x-axis having the time of 1 day, every horizontal bar shows one of the aircraft of the
    % airline and its successive flights. The color part of the bar starts and ends at the departure
    % and arrival times of each aircraft operation. Check that all flights in VF have been allocated
    % successfully. Check what is the problem with the AC#4 of the airline fleet. Propose a method
    % to solve it.
    [~, rows] = size(A.fleet); % Compute the size of Airline fleet
    n = 1;
    delta = zeros(rows, 14); % Preallocate delta
    while(n<=rows)
        o = 1;
        [~, rows_A] = size(A.fleet(n).flights); % Compute the size of flights of Airline fleet at n
        while(o<=rows_A)
            % Calculate departure_time, arrival_time and delay
            departure_time = convert_time(A.fleet(n).flights(o).departure_time);
            arrival_time = convert_time(A.fleet(n).flights(o).arrival_time);
            delay = A.fleet(n).flights(o).delay;
            % Check if we have to fix arrival on next day
            if(arrival_time > departure_time) % If not, directly plot until next flight
                delta_time = arrival_time - departure_time;
            else % If fixing is needed add the patch
                delta_time = (1440 - departure_time) + arrival_time;
            end
            if(o == 1) % If its first one use custom format
                if(delay > 0) % If there is a delay add it in red
                    delta(n, 2) = departure_time - delay; 
                    delta(n, 3) = delay;
                else
                    % Trick to correct bar colors
                    delta(n, 2) = departure_time - 0.0000000000000000001;
                    delta(n, 3) = 0.0000000000000000001;
                end
                delta(n, 4) = delta_time;
            else
                % Calculate previous arrival time
                prev_arrival_time = convert_time(A.fleet(n).flights(o - 1).arrival_time);
                big_delay = departure_time - prev_arrival_time - delay;
                if((delay > 0) && (big_delay > 0)) % If there is a delay add it in red
                    delta(n, ((3*o) - 1)) = departure_time - prev_arrival_time - delay; 
                    delta(n, 3*o) = delay;
                elseif((delay > 0) && (big_delay < 0)) % If there is a delay add it in red
                    delta(n, ((3*o) - 1)) = 0; 
                    delta(n, 3*o) = 60;
                else
                    % Trick to correct bar colors
                    delta(n, ((3*o) - 1)) = departure_time - prev_arrival_time - 0.0000000000000000001;
                    delta(n, 3*o) = 0.0000000000000000001;
                end
                delta(n, ((3*o) + 1)) = delta_time;
            end
            if(o == rows_A && arrival_time > departure_time) % Check if flight is last one and arrival is before next day
                prev_arrival_time = convert_time(A.fleet(n).flights(o).arrival_time);
                delta(n, ((3*o) + 2)) = 1440 - prev_arrival_time;
            end
            o = o + 1;
        end
        n = n + 1;
    end
    figure('Name','Airline Schedule','NumberTitle','off');
    b = barh(delta, 'stacked'); % Plot stacked horizontal bar graph
    % Set correct color scheme
    C=['w','w','r','b','w','r','b','w','r','b','w','r','b','w'];
    n = 1;
    while(n<=length(b))
        set(b(n),'facecolor',C(n));
        n = n + 1;
    end
    n = 1;
    % Set correct Ticks and Labels
    XTick = zeros(1,9);
    XLabels = zeros(1,9);
    while(n<=9)
        XTick(n) = 3 * n * 60;
        XLabels(n) = 3 * n;
        n = n + 1; 
    end
    set(gca,'XTick', XTick);
    set(gca,'XTickLabel',XLabels)
end

