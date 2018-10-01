import sys
import bottle
import urllib.request
import json
import collections
import datetime
import locale
import unidecode

# To ensure correct datetime formatting
locale.setlocale(locale.LC_TIME, "is_IS")

# Get pricing information
with urllib.request.urlopen("https://apis.is/petrol") as url:
    petrol = json.loads(url.read())

# Split pricing info based on company
split_petrol = collections.defaultdict(list)
for line in petrol["results"]:
    # Key is normalized company name
    normalized = unidecode.unidecode(line["company"]).lower().replace(" ", "-")
    split_petrol[normalized].append(line)

# Parse JSON timestamp and convert to string
timestamp = datetime.datetime.strptime(petrol["timestampPriceCheck"],
                                       "%Y-%m-%dT%H:%M:%S.%f")
time_str = timestamp.strftime("%c")


# ======
# Routes
# ======
@bottle.route("/static/<filename:path>")
def static_file(filename):
    return bottle.static_file(filename, root="static")


@bottle.route("/")
def index():
    return bottle.template("index.tpl", petrol=split_petrol, time_str=time_str)


@bottle.route("/company/<co>")
def company(co):
    # Company must exist
    if co in split_petrol.keys():
        return bottle.template("company.tpl", company=co,
                               stations=split_petrol[co], time_str=time_str)
    else:
        bottle.abort(404)


@bottle.route("/company/<co>/<s_key>")
def station(co, s_key):
    # Find station based on key
    station = {}
    for s in split_petrol[co]:
        if s["key"] == s_key:
            station = s
    # If no station was found with key, raise error
    if station == {}:
        bottle.abort(404)
    else:
        return bottle.template("station.tpl", company=co,
                               time_str=time_str, station=station)


@bottle.error(404)
def error404(error):
    return "<h1>Error 404: Page not found.</h1>"


bottle.run(host="0.0.0.0", port=sys.argv[1], reloader=True, debug=True)
