function map_flights( VF, VA )
    [fileID, er] = fopen('Routes.kml', 'w');
    if (fileID == -1)
        disp(er);
        return;
    end
    [~, rows] = size(VF);
    n = 1;
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

