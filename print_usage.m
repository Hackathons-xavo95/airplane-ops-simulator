function print_usage(  )
    % Shows all options available in the menu(Thanks to StackOverflow)
    disp('--initialize option--');
    disp('(i) read all data from the input files into the necessary main variables');
    disp('--modification options--');
    disp('(a) assign flights to the airline aircraft');
    disp('(c) calculate total operational cost related to airports services');
    disp('(d) enter a delay and reschedule');
    disp('(r) cancel a flight and reschedule flights from scratch');
    disp('--output options--');
    disp('(k) map airports and flights into KML files');
    disp('(f) plot flights');
    disp('(p) plot aircraft schedule');
    disp('(s) plot airport services costs of an aircraft');
    disp('(w) write current airline schedule into a file');
    disp('--end option--');
    disp('(e) end program');
end

