# Open Budget Survey Explorer

* Live version: http://survey.internationalbudget.org

Developed in collaboration between the [International Budget Partnership](http://internationalbudget.org) and the [Open Knowledge Foundation](http://okfn.org). Written by [Tom Rees](http://github.com/zephod), [Hélène Durand](http://github.com/hdurand) and [Tryggvi Björgvinsson](http://github.com/trickvi).

## Setup & Deployment

This is a web application developed using [Brunch](http://brunch.io). To run locally:

* Clone this repository. 
* Install [Node](http://nodejs.org) and [Brunch](http://brunch.io).
* Run `brunch watch --server` in the root directory of this repo.
* Point your browser at http://localhost:3333.

To deploy:

* Get the above working.
* Kill the `brunch` server.
* Delete the `./public` folder if one has been created.
* Run `brunch build --minify`.
* Deploy the `./public` folder to your web server.

## Updating the data

All the data lives in the `./data` folder, along with a Pythin tool to Extract-Transform-Load it through a complicated data-massage. Outputs are:

* `./vendor/ibp_dataset.js` which is used by the javascript datatool.
* `./app/assets/downloads/` which is filled with downloadable files.

To update the data:

* Modify the Excel files in the `./data` folder.

To get those changes processed by the tool:

* Get Python set up on your system.
* Install [Pip](http://pypi.python.org/pypi/pip), the Python package manager.
* `pip install openpyxl`
* `pip install unicodecsv`
* `pip install xlrd`
* You're all set up. Run `python etl.py` to update the tool.
* Run the tool locally to prove it works. 
* Follow the above deployment instructions to get it ready for a live server.
