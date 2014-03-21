function constructGraph()

    noFlightEdges = {};
    timeBetween = [];

    x0 = [8.00 9.00]; 
    x0_name = ['boston' 'philly']; % boston to philly
    x1 = [9.50 10.50]; 
    x1_name = ['philly' 'boston']; % philly to boston
    x2 = [12.00 13.00]; 
    x2_name = ['boston' 'philly']; % boston to philly
    x3 = [13.50 14.50];
    x3_name = ['philly' 'boston']; % philly to boston 
    x4 = [16.00 17.00];
    x4_name = ['boston' 'philly']; % boston to philly
    x5 = [18.00 19.00]; 
    x5_name = ['philly' 'boston']; % philly to boston
    x6 = [7.00 9.50]; 
    x6_name = ['boston' 'chicago']; % boston to chicago
    x7 = [11.00 13.50];
    x7_name = ['boston' 'chicago']; % boston to chicago
    x8 = [16.00 18.50]; 
    x8_name = ['boston' 'chicago']; % boston to chicago
    x9 = [9.50 12.00]; 
    x9_name = ['chicago' 'boston']; % chicago to boston
    xa = [14.00 16.50];
    xa_name = ['chicago' 'boston']; % chicago to boston
    xb = [19.50 22.00];
    xb_name = ['chicago' 'boston']; % chicago to boston
    xc = [9.00 12.00];
    xc_name = ['chicago' 'philly']; % chicago to philly
    xd = [10.00 13.00];
    xd_name = ['philly' 'chicago']; % philly to chicago
    xe = [15.00 18.00];
    xe_name = ['chicago' 'philly']; % chicago to philly
    xf = [12.00 15.00];
    xf_name = ['philly' 'chicago']; % philly to chicago

    flights = {x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xa xb xc xd xe xf};
    names = {x0_name x1_name x2_name x3_name x4_name x5_name x6_name x7_name x8_name x9_name xa_name xb_name xc_name xd_name xe_name xf_name};
    inc = 1;
    for i = 1:16
        for j = i:16
            timeBetween(j) = flights{i}(2) - flights{j}(1);
            if (timeBetween(j) ~= 0)
                if (timeBetween(j) < .5)
                    noFlightEdges{inc} = [flights(j), flights(i)];
                    inc = inc + 1;
                    continue;
                elseif ( timeBetween(j) < 1 ) && ( ( strcmp(names{i}(4), 'philly') && strcmp(names{i}(3), 'boston') ) || ( strcmp(names{i}(4), 'boston') && strcmp(names{i}(3), 'philly') ) )
                    noFlightEdges{inc} = [flights(j), flights(i)];
                    inc = inc + 1;
                    continue;
                elseif ( timeBetween(j) < 2.5 ) && ( ( strcmp(names{i}(4), 'chicago') && strcmp(names{i}(3), 'boston') ) || ( strcmp(names{i}(4), 'boston') && strcmp(names{i}(3), 'chicago') ) )
                    noFlightEdges{inc} = [flights(j), flights(i)];
                    inc = inc + 1;
                    continue;
                elseif ( timeBetween(j) < 3 ) && ( ( strcmp(names{i}(4), 'chicago') && strcmp(names{i}(3), 'philly') ) || ( strcmp(names{i}(4), 'philly') && strcmp(names{i}(3), 'chicago') ) )
                    noFlightEdges{inc} = [flights(j), flights(i)];
                    inc = inc + 1;
                    continue;
                end
            end
        end
    end
    
    celldisp(noFlightEdges);
end