function plot_flights( VF )
    % Given a vector of structs Tflight, this function shows a plot with all the flights
    % schedule. 
    % Over an x-axis having the time of 1 day, every horizontal bar shows one of the flights. The
    % color part of the bar starts and end at the departure and arrival times respectively. Test that
    % the flights in VF are sorted by their departure time.
    [~, rows] = size(VF); % Compute the size of flight vector
    n = 1;
    delta = zeros(rows, 5); % Preallocate delta
    while(n<=rows)
        % Calculate departure_time, arrival_time and delay
        departure_time = convert_time(VF(n).departure_time);
        arrival_time = convert_time(VF(n).arrival_time);
        delay = VF(n).delay;
        if(delay > 0) % If there is a delay add it in red
            delta(n, 2) = departure_time - delay;
            delta(n, 3) = delay;
        else
            % Trick to correct bar colors
            delta(n, 2) = departure_time - 0.0000000000000000001;
            delta(n, 3) = 0.0000000000000000001;
        end
        % Check if we have to fix arrival on next day
        if(arrival_time > departure_time) % If not, directly plot until end of day
            delta_time = arrival_time - departure_time;
            delta(n, 5) = 1440 - arrival_time;
        else % If fixing is needed add the patch
            delta_time = (1440 - departure_time) + arrival_time;
        end
        delta(n, 4) = delta_time;
        n = n + 1;
    end
    figure('Name','Flight Schedule','NumberTitle','off');
    b = barh(delta, 'stacked'); % Plot stacked horizontal bar graph
    % Set correct color scheme
    C=['w','w','r','g','w'];
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

