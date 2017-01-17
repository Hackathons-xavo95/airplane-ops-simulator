function [ A ] = allocate_flights( VF )
    A = create_airline(10);
    n = 1;
    [~, rows] = size(VF);
    while(n<=rows)
        o = 1;
        [~, rows_A] = size(A.fleet);
        encontrado = false;
        while(o<=rows_A && ~encontrado)
            if(check_schedule(A.fleet(o), VF(n)))
                A.fleet(o) = add_schedule(A.fleet(o), VF(n));
                encontrado = true;
            else
                o = o + 1;
            end
        end
        n = n + 1;
    end
end

