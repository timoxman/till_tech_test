Till tech test
==============

This is an implementation of the 'Till Tech Test'
This is a fake tech_test for a fake job.

The functionaility will eventually replicate the functionaility found on a till system at a rather trendy coffee shop.

![a till](/images/till.jpg)

Technology
----------
I have chosen to build my implementation using:
Rails - This provides the back end, it provides several API's to populate the menu and receive the order and generate the receipt.
AngularJS - This will provide the front end functionaility and the till interface. Using Angular will allow the interface to be dynamic depending on the menu items on offer at the current time

I have chosen these technologies as a particular challenge to get them to work together with at yet I have not managed to achieve.


Running the app.
----------------
* Run `Bundle` to install my gems
* bin/rake db:create - to crate my databases
* Start the rails server: `bin rails s`
* The home page will be at: `http://localhost:3000/`
* To run the back end services see the routes.rb file but these include
  * pricelists/buildPriceList - saves a pricelist to a postgres table
  * pricelists/getMenu - supplies details of the saved menu
  * pricelists/generateReceipt - takes an order and generates a json receipt with is returned.
