import json
import pandas as pd
from flask import (
    Flask,
    render_template,
    jsonify,
    request)


@app.route("/")
def home():
    render_template("index.html")

@app.route("/names")
# list of sample names - get columns names from samples table

@app.route("/otu")
# list of otu descriptions - from otu table, get "lowest_taxonomic_unit_found" column all rows
@app.route("/metadata/<sample>")
# get metadata for a given sample "BB_940" get age, bbtype, ethnicity, gender, location, sampleid

@app.route("/wfreq/<sample>")
# go to samples_metadata table, return wfreq column that matches given sample

@app.route("/samples/<sample>")

# 



if __name__ == "__main__":
    app.run(debug=True)