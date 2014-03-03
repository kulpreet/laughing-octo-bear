Todos
=========

A Test application

APP
=========

The Application is online for testing purposes at [Here](http://ancient-ravine-8986.herokuapp.com/)

API
=========

The App support OAuth2 authentication. You can add an application [here](http://ancient-ravine-8986.herokuapp.com/oauth/applications)

The Restful API if for the resource 'todo', the supported media type is 'applicatio/json'

* GET /api/v1/todos.json Gets all todos for authenticated user
* POST /api/v1/todos.json Create a todo for authenticated user
* PUT  /api/v1/todos/:id Update a todo with given id. The todo should belong to authenticated user
* DELETE /api/v1/todos/:id Delete a todo with the given id. The todo should belong to authenticated user

Testing API
------------

* Add an application by going to /oauth/applications. Use the http://ancient-ravine-8986.herokuapp.com as
  the redirect URL. You will need to be signed in as a user first. All
  users have access to this page for now - no special admin rights
  required.

* Once an application has been added, go to the application's page and
  click on the 'Authorize' link. You will then be redirected back to
  the application with a valid token available.

* Now you to go to the API end points from the browser, for example /api/v1/todos.json will return a json of all the todos belonging to the user that has received valid tokens in the second step.

