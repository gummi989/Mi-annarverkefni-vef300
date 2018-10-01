<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Lowest Prices</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="/static/main.css" />
</head>
<body>
    <header>
        <h1>Lowest Prices</h1>
    </header>
    <table>
        <thead>
            <tr>
                <th>Company</th>
                <th>95 Octane</th>
                <th>Diesel</th>
            </tr>
        </thead>
        <tbody>
            <!-- TODO: Mark which company has lowest price -->
            % for company, stations in petrol.items():
            %   low_95, low_95_index = min((station["bensin95"], i) for i, station in enumerate(stations))
            %   low_diesel, low_diesel_index = min((station["diesel"], i) for i, station in enumerate(stations))
                <tr>
                    <td class="company-name">
                        <a href="/company/{{company}}"><img class="logo" src="/static/logo/{{company}}.svg" alt="{{stations[0]['company']}}"></a>
                    </td>
                    <td class="gas-95">{{low_95}}</td>
                    <td class="diesel">{{low_diesel}}</td>
                </tr>
            % end
        </tbody>
    </table>
    %include("footer.tpl")
</body>
</html>