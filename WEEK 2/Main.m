VA = read_airports('Airports.txt');
[air, ind] = search_airport( VA, 'ESSA' );
map_airports(VA);

VF = read_flights('JTG.txt');
map_flights(VF, VA);

plot_flights(VF);

A = allocate_flights(VF);
plot_airline(A);
