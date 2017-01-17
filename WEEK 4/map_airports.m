function map_airports( VA )
    % Given a vector of structs Tairport, this function writes Airports.kml, a KML file
    % with the location of all the airports in the vector VA. Each airport is a KML Placemark of
    % type Point.
    [fileID, er] = fopen('Airports.kml', 'w'); % Open Airports.kml with write permissions
    if (fileID == -1) % If we fail to open the file
        disp(er);
        return;
    end
    [~, rows] = size(VA); % Compute the size of Airports vector
    n = 1;
    % Write the file following Google instructions
    fprintf(fileID, '<kml xmlns="http://www.opengis.net/kml/2.2">\n');
    fprintf(fileID, '<Document>\n');
    while(n<rows)
        fprintf(fileID, '	<Placemark>\n');
        fprintf(fileID, '       <name>%s</name>\n', VA(n).id);
        fprintf(fileID, '       <description>%s</description>\n', VA(n).description);
        fprintf(fileID, '       <Point>\n');
        fprintf(fileID, '           <coordinates>%s</coordinates>\n', VA(n).coordinates);
        fprintf(fileID, '       </Point>\n');
        fprintf(fileID, '	</Placemark>\n');
        n = n + 1;
    end
    fprintf(fileID, '</Document>\n');
    fprintf(fileID, '</kml>\n');
    fclose(fileID);
end

