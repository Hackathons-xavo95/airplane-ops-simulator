function map_airports( VA )
    [fileID, er] = fopen('Airports.kml', 'w');
    if (fileID == -1)
        disp(er);
        return;
    end
    [columms, rows] = size(VA);
    n = 1;
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

