class TasksController < ApplicationController
  get '/tasks' do
    # Step 9a:
    # Look up all the tasks in the database (by uncommenting the following line
    # tasks = Task.all
    # Step 9b:
    # Pass that list of all tasks to the `erb` partial by adding an extra argument to the erb call below:
    #   locals: { tasks: Task.all }
    # to the end of the line below (similar to what we did with our "Hello, World!" Sinatra app
    erb :"tasks/index.html"
  end
end
