function map_flights( VF, VA )
    % Given a vector of structs Tflight and a vector of structs Tairport, this function
    % writes Routes.kml, a KML file with the routes of all the flights in vector VF. Each route is a
    % KML LineString from the departure airport to the arrival airport.
    [fileID, er] = fopen('Routes.kml', 'w'); % Open Routes.kml with write permissions
    if (fileID == -1) % If we fail to open the file
        disp(er);
        return;
    end
    [~, rows] = size(VF); % Compute the size of Flights vector
    n = 1;
    % Write the file following Google instructions
    fprintf(fileID, '<kml xmlns="http://www.opengis.net/kml/2.2">\n');
    fprintf(fileID, '<Document>\n');
    while(n<rows)
        fprintf(fileID, '	<Placemark>\n');
        fprintf(fileID, '       <name>%s-%s</name>\n', VF(n).departure, VF(n).arrival);
        fprintf(fileID, '       <LineString>\n');
        fprintf(fileID, '           <extrude>1</extrude>\n');
        fprintf(fileID, '           <coordinates>\n');
        [air, ~] = search_airport( VA, VF(n).departure );
        fprintf(fileID, '               %s\n', air.coordinates);
        [air, ~] = search_airport( VA, VF(n).arrival );
        fprintf(fileID, '               %s\n', air.coordinates);
        fprintf(fileID, '           </coordinates>\n');
        fprintf(fileID, '       </LineString>\n');
        fprintf(fileID, '	</Placemark>\n');
        n = n + 1;
    end
    fprintf(fileID, '</Document>\n');
    fprintf(fileID, '</kml>\n');
    fclose(fileID);
end

