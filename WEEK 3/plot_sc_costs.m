function plot_sc_costs( VC, sc )
    [~, rows] = size(VC);
    figure('Name','Planned costs','NumberTitle','off');
    bar(VC);
    n = 1;
    while(n<=(rows-1))
        XLabels(n) = string(sc.flights(n).departure);
        n = n + 1; 
    end
    XLabels(n) = string(sc.flights(n - 1).arrival);
    XLabels = cellstr(XLabels);
    set(gca,'XTickLabel',XLabels)
end

