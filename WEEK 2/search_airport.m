function [ air, ind ] = search_airport( VA, name )
    [~, rows] = size(VA);
    n = 1;
    encontrado = false;
    while(n<=rows && ~encontrado)
        if(strcmp(VA(n).id, name))
            encontrado = true;
        else
            n = n + 1;
        end
    end
    if encontrado
        air = VA(n);
        ind = n;
    else
        air = create_airport();
        ind = -1;
    end
end

