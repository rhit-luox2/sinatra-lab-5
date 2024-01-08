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


  # Step 20: Create a new Sinatra route for "/tasks/new"
  #   (see "Routes" in https://sinatrarb.com/intro.html if you need a hint,
  #   or just mimic what we have above for `/tasks`)
  #
  # Step 21: Let the tests prompt you to, add a line to render the erb file
  #   "tasks/new.html" (as before, you can refer to the code we have for `/tasks`)
  #
  #   P.S. Normally, you would have to create the erb view file yourself, but I have
  #   included it in this commit to save you some frustration




  # Step 26a: At this point, we need to create the task, and then
  #          redirect back to the homepage so that the user can see
  #          that the task was created.
  #
  #          For today, we will not be worrying about form validations,
  #          but we will be adding tests for those!
  post '/tasks' do
    # Step 27: After the tests reveal that you still haven't saved the task,
    #          uncomment these lines to actually save the data!
    #
    #          Note: ActiveRecord does sanitize the incoming data for us.
    #
    # task = Task.new(description: params[:description])
    # task.save!
    # Step 26b: Since your first test failure is "Not Found", you will start by
    #           uncommenting the following line, to redirect back to the homepage:
    # redirect "/"
  end
end
