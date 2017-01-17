function [ A_mod ] = calculate_costs( A, VA )
    A_mod = A;
    [~, rows] = size(A.fleet);
    n = 1;
    while(n<=rows)
        VC = calculate_sc_costs(A.fleet(n), VA);
        [~, rows_VC] = size(VC);
        o = 1;
        while(o<=rows_VC)
            A_mod.total_costs = A_mod.total_costs + VC(o);
            o = o + 1;
        end
        n = n + 1;
    end
end

