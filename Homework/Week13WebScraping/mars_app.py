###########################################################################
#
###########################################################################
from flask import Flask, render_template, jsonify, redirect
from flask_pymongo import PyMongo
import scrape_mars

app=Flask(__name__)
mongo=PyMongo(app)

@app.route('/')
def index():
    mars=mongo.db.mars.find_one()
    return render_template("index.html",mars=mars)

@app.route('/scrape')
def scrape():
    mars=mongo.db.mars
    mars_dict=scrape_mars.scrape()
    mars.update(
        {},
        mars_dict,
        upsert=True
    )

    return redirect("http://localhost:5000/", code=302)


# @app.route('/')
# def index():
#     surfing = mongo.db.surfing.find_one()
#     return render_template('index.html', surfing=surfing)


# @app.route('/scrape')
# def scrape():
#     surfing = mongo.db.surfing
#     data = scrape_surfing.scrape()
#     surfing.update(
#         {},
#         data,
#         upsert=True
#     )
#     return redirect("http://localhost:5000/", code=302)


# if __name__ == "__main__":
#     app.run(debug=True)






if __name__ == "__main__":
    app.run(debug=True)