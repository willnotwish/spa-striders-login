# README

This dummy app acts as a highly insecure authentication mechanism. It should not be used in production, or with real data.

It takes whatever email address the user enters, and tries to find a corresponding
user record. If it finds one, it authenticates that user by setting its database ID in Rails' http session.

## Testing

To test it out with the Bookings app, deploy the latter (also a Rails app) to the subdirectory ```/bookings-test``` by setting the environment variable RAILS_RELATIVE_URL_ROOT, according to the instructions here:

https://edgeguides.rubyonrails.org/configuring.html#deploy-to-a-subdirectory-relative-url-root

Then configure an nginx proxy listening on localhost:2000 to forward requests to ```/bookings-test``` to the upstream bookings app, and all other requests to this app at /.

Orchestrate the containers using docker-compose.

Create some (identical) users in both apps using each Rails console. Make one of the users an admin in the bookings app.

Visit http://localhost:2000/login and log in as that admin by entering the appropriate email address.

Then, in the same browser session, visit http://localhost:2000/bookings-test/admin

You should see the expected admin page, showing the correct admin user.

## How it works

The same session cookie must exist in both apps. For the browser not to know the difference, a reverse proxy (nginx) is used to route traffic to the correct application based on the path requested. Check cookies to troubleshoot if necessary.



