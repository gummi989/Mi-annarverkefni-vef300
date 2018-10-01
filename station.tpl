<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>{{station["company"]}} - {{station["name"]}}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="/static/main.css" />
</head>
<body>
    <header>
        <h1><img class="logo" src="/static/logo/{{company}}.svg" alt="{{station['company']}}"></h1>
        <h2>Station: {{station["name"]}}</h2>
    </header>
    <table>
        <thead>
            <tr>
                <th>95 Octane</th>
                <th>Diesel</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>{{station["bensin95"]}}</td>
                <td>{{station["diesel"]}}</td>
            </tr>
        </tbody>
    </table>
    %include("footer.tpl")
</body>
</html>