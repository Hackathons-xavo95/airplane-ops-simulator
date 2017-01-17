function plot_sc_costs( VC, sc )
    % Given the VC vector of the costs of a schedule sc, this function plots the costs
    % for the aircraft in the different airport services in one day, showing as x-labels the name of
    % the airport to which the payment shall be done. Use the normal bar function.
    [~, rows] = size(VC); % Compute the size of cost vector
    figure('Name','Planned costs','NumberTitle','off');
    bar(VC); % Do a bar graph with the costs by airport
    n = 1;
    % Set the labels to correct airport
    while(n<=(rows-1))
        XLabels(n) = string(sc.flights(n).departure);
        n = n + 1; 
    end
    XLabels(n) = string(sc.flights(n - 1).arrival);
    XLabels = cellstr(XLabels); % Do the conversion of the labels
    set(gca,'XTickLabel',XLabels)
end

