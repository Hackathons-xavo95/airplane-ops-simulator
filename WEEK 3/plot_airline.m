function plot_airline( A )
    [~, rows] = size(A.fleet);
    n = 1;
    delta = zeros(rows, 10);
    while(n<=rows)
        o = 1;
        [~, rows_A] = size(A.fleet(n).flights);
        while(o<=rows_A)
            departure_time = convert_time(A.fleet(n).flights(o).departure_time);
            arrival_time = convert_time(A.fleet(n).flights(o).arrival_time);
            if(arrival_time > departure_time)
                delta_time = arrival_time - departure_time;
            else
                delta_time = (1440 - departure_time) + arrival_time;
            end
            if(o == 1)
                delta(n, 2*o) = departure_time;
                delta(n, ((2*o) + 1)) = delta_time;
            else
                prev_arrival_time = convert_time(A.fleet(n).flights(o - 1).arrival_time);
                delta(n, 2*o) = departure_time - prev_arrival_time;
                delta(n, ((2*o) + 1)) = delta_time;
            end
            if(o == rows_A && arrival_time > departure_time)
                prev_arrival_time = convert_time(A.fleet(n).flights(o).arrival_time);
                delta(n, ((2*o) + 2)) = 1440 - prev_arrival_time;
            end
            o = o + 1;
        end
        n = n + 1;
    end
    figure('Name','Airline Schedule','NumberTitle','off');
    b = barh(delta, 'stacked');
    C=['w','w','b','w','b','w','b','w','b','w'];
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

