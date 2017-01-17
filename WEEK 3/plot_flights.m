function plot_flights( VF )
    [~, rows] = size(VF);
    n = 1;
    delta = zeros(rows, 4);
    while(n<=rows)
        departure_time = convert_time(VF(n).departure_time);
        arrival_time = convert_time(VF(n).arrival_time);
        if(arrival_time > departure_time)
            delta_time = arrival_time - departure_time;
            delta(n, 2) = departure_time;
            delta(n, 3) = delta_time;
            delta(n, 4) = 1440 - arrival_time;
        else
            delta_time = (1440 - departure_time) + arrival_time;
            delta(n, 2) = departure_time;
            delta(n, 3) = delta_time;
        end
        n = n + 1;
    end
    figure('Name','Flight Schedule','NumberTitle','off');
    b = barh(delta, 'stacked');
    C=['w','w','g','w'];
    n = 1;
    while(n<=length(b))
        set(b(n),'facecolor',C(n));
        n = n + 1;
    end
    n = 1;
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

