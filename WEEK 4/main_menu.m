salir = false;
VA = {};
VF = {};
A = {};

while(~salir)
    print_usage(); %display menu
    choice = input('Choose an option','s'); %ask user for input option
    switch choice
        case 'i'
            VA = read_airports('Airports.txt');
            VF = read_flights('JTG.txt');
            VA = read_costs(VA, 'Costs.txt');
            if(isempty(VF) || isempty(VA))
                disp('Errors loading files');
            else
                disp('Data correctly loaded');
            end
        case 'a' % to correct
            if(isempty(VF))
                disp('Please read the data first');
            else
                A = allocate_flights(VF);
                disp('Flights correctly allocated');
            end
        case 'c'
            if(isempty(A))
                disp('Please read the data first');
            else
                A = calculate_costs(A, VA);
                disp('Total Airline costs: ');
                disp(A.total_costs);
            end
        case 'd' %tomodify
            write_operations(A);
            disp('Data Wrote');
        case 'r' %tomodify
            salir = true;
        case 'k'
            if(isempty(VA))
                disp('Please read the data first');
            else
                map_airports(VA);
                map_flights(VF, VA);
                disp('Generated Airports.kml and Routes.kml');
            end
        case 'f'
            if(isempty(VF))
                disp('Please read the data first');
            else
                plot_flights(VF);
            end
        case 'p'
            if(isempty(A))
                disp('Please read the data first');
            else
                plot_airline(A);
            end
        case 's'
            if(isempty(A))
                disp('Please read the data first');
            else
                choice = menu('Choose the Schedule','Schedule 1','Schedule 2','Schedule 3','Schedule 4','Schedule 5','Schedule 6','Schedule 7','Schedule 8','Schedule 9','Schedule 10');
                VC = calculate_sc_costs(A.fleet(choice), VA);
                plot_sc_costs(VC, A.fleet(choice));
            end
        case 'w'
            if(isempty(A))
                disp('Please read the data first');
            else
                write_operations(A);
                disp('Data correctly wrote to Airports.txt');
            end
        case 'e'
            salir = true;
            disp('Exiting');
        otherwise
            disp('Incorrect option, please select a  valid option');
    end
end
