<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{{stations[0]["company"]}}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="/static/main.css" />
</head>
<body>
    <header>
        <h1><img class="logo" src="/static/logo/{{company}}.svg" alt="{{stations[0]['company']}}"></h1>
    </header>
    <table>
        <thead>
            <tr>
                <th>Station</th>
                <th>95 Octane</th>
                <th>Diesel</th>
            </tr>
        </thead>
        <tbody>
            <!-- TODO: Add special case for when all stations have the same price -->
            % low_95, low_95_index = min((station["bensin95"], i) for i, station in enumerate(stations))
            % low_diesel, low_diesel_index = min((station["diesel"], i) for i, station in enumerate(stations))
            % for station in stations:
                <tr class="station{{' low-95' if station['bensin95'] == low_95 else ''}}{{' low-diesel' if station['diesel'] == low_diesel else ''}}">
                    <td class="station-name">
                        <a href="/company/{{company}}/{{station['key']}}">{{station["name"]}}</a>
                    </td>
                    <td class="gas-95">{{station["bensin95"]}}</td>
                    <td class="diesel">{{station["diesel"]}}</td>
                </tr>
            % end
        </tbody>
    </table>
    %include("footer.tpl")
</body>
</html>