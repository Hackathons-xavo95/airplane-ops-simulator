read = '(i) read all data from the input files into the necessary main variables';
plotter = '(p) plot costs of airports services for one aircraft';
calculate = '(c) calculate total operational cost related to airports services';
write = '(w) write current airline schedule into a file';
ender = '(e) end program';
salir = false;
VA = {};
VF = {};
A = {};

while(~salir)
    choice = menu('Choose the option',read,plotter,calculate,write,ender);
    
    switch choice
        case 1
            VA = read_airports('Airports.txt');
            VF = read_flights('JTG.txt');
            VA = read_costs(VA, 'Costs.txt');
            A = allocate_flights(VF);
            disp('Data Loaded');
        case 2
            if(isempty(A))
                disp('Please read the data first');
            else
                choice = menu('Choose the Schedule','Schedule 1','Schedule 2','Schedule 3','Schedule 4','Schedule 5','Schedule 6','Schedule 7','Schedule 8','Schedule 9','Schedule 10');
                VC = calculate_sc_costs(A.fleet(choice), VA);
                plot_sc_costs(VC, A.fleet(choice));
            end
        case 3
            A = calculate_costs(A, VA);
            disp('Total Airline costs: ');
            disp(A.total_costs);
        case 4
            write_operations(A);
            disp('Data Wrote');
        case 5
            salir = true;
    end
end
