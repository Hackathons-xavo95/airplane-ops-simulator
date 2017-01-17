VA = read_airports('Airports.txt');
map_airports(VA);

VF = read_flights('JTG.txt');
map_flights(VF, VA);
%plot_flights(VF);

A = allocate_flights(VF);
%plot_airline(A);

VA = read_costs(VA, 'Costs.txt');
%VC = calculate_sc_costs(A.fleet(1), VA);
%plot_sc_costs(VC, A.fleet(1));
A = calculate_costs(A, VA);
write_operations(A);