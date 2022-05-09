# Installation and Usage Instructions
[< Back to `readme.md`](../../readme.md)
<hr>

## Installation
Pantry Packer is designed to be a web-based applicaton, written in Ruby on Rails and using a PostgreSQL database. Assuming that the application is already hosted on a web server, there is no installation required in order to use the application; users can simply navigate to the website and begin using the functionality provided by the application.

If the application is _not_ already being hosted, or you would like to host your own version, you will need to install and configure the following software:

1. Ruby version 3.0.2p107 or later.
2. Ruby on Rails version 7.0.2.2 or later.
3. Your desired database that works with Rails. The application was initially developed using PostgreSQL version 13.5

The application should ideally be hosted on a designated web server. The operating system that Pantry Packer was developed with and tested on was CentOS Linux version 7. The application should work fine on other operating systems that run the software mentioned above.

Download the project from GitHub and install any dependencies using the Bundle Gem. Navigate to the `src` folder and launch the server using the following command:

    rails s --binding=<your_ip_here>

Finally, test out the application by entering the IP address of the web server into your browser, using `:3000` as the port number (this is the default port number used by the Rails server).

<hr>
<br>

## Usage
Pantry Packer is an application that is designed for two types of users: Pantry representatives and food donors. The actions associated with both users are slightly different, so they will be broken up here for simplicity. Note that food donor actions can also be conducted by pantry representatives, but the same is _not_ true the other way around.

### __Pantry Representatives__
Pantry representatives must first create an account to begin using the application. The rep will click the 'log in' button and then the 'sign up' link on this page. The representative must enter some account-related information (username and password) as well as information relating to the pantry in which they are representing. This information will appear to other users of the site, so they should make sure to only reveal what is necessary. The representative can always navigate to 'account' in the navigation bar to edit their account and pantry properties and even delete their account and all associated requests if they desire.

Once a representative has made an account, they will see a new tab on the navigation bar: manage pantry. Here, the rep can make a new request for some food item for their pantry. By clicking the 'new request' button, the rep will be prompted with a form to indicate a name for their request, a food item type for their request, a description, as well as the ability to indicate whether they are encouraging the requested item or would like to _not_ receive it. Once they create the request, they will see it in their personaly 'manage pantry' list as well as the 'view requests' page. They can edit their request at either location.

### __Food Donors__
Once requests have been made by pantries, food donors can search for a request to fulfil within the 'view requests' page. By default, all requests are shown and in an arbitrary order, but this can be changed by the food donor. A search string can be used to search for pantry name, description, location, website link, request name, description, and even item type. This search bar is very powerful, spanning all attributes of bother pantries themselves as well as their requests.

In addition, food donors can select as many food type checkboxes to further filter their search. Leaving all boxes blank is the same as checking all boxes; only those checked will show up, unless they are all left blank, in which case all requests will _also_ show up. Positive and negative requests can also be filtered using their own set of checkboxes. Positive and negative requests will be indicated in the table by the color of the request's row.