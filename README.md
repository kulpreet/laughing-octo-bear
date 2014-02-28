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

* GET /todos.json Gets all todos for authenticated user
* POST /todos.json Create a todo for authenticated user
* PUT  /todos/:id Update a todo with given id. The todo should belong to authenticated user
* DELETE /todos/:id Delete a todo with the given id. The todo should belong to authenticated user
