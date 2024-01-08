require_relative '../spec_helper'

feature "Managing Tasks", js: true do
  scenario "viewing the homepage with todo items", skip: "Step 2 - Unskip this test" do
    expect(Task.all).to be_empty # Sanity check that the test database is empty
    # Step 3 - Let the error "undefined method `all' for Task:Class"
    #          drive you to the model layer tests to begin implementing the Task model
    #          (look for the text "Step 4" to find your next destination!)
    task1 = Task.create(description: 'Eat breakfast')
    task2 = Task.create(description: 'Join class session')
    task3 = Task.create(description: 'Work on lab')
    visit '/'
    todo_lis = page.find_all("ul#todos li")
    todos_text = todo_lis.map{|todo_li| todo_li.text}
    expected_todos = ["Eat breakfast", "Join class session", "Work on lab"]
    # Step 6 - Return to this test.  You should now have an error along the lines of
    #              expected: ["Eat breakfast", "Join class session", "Work on lab"]
    #              got: []
    #          Use this to drive you to implement the view to display a list of tasks
    #          (See "Step 7"!)
    todos_text.should eq expected_todos
    # Step 10 - The above assert now passes, and you should see a failure in the next line
    #          Use this failure to motivate completing Step 9!
    page.should_not have_content "This page will soon be home to a TODO app!"
    page.should_not have_content "There are no tasks remaining! You should add one!"
  end

  scenario "viewing the homepage without todo items", skip: "Step 12: Unskip this test" do
    visit "/"
    page.should_not have_content "This page will soon be home to a TODO app!"
    page.should have_content "There are no tasks remaining! You should add one!"
  end

  scenario "creating a new todo item", skip: "Step 16: Unskip this test" do
    # Note that this test doesn't stipulate that we have to do this old-school form submission.
    # We could easily upgrade this to be a SPA without this test having to change at all!
    # We happen to be implementing it as a separate page but it could just as easily be on
    # this page with no changes to the test.
    visit "/"
    # Step 17: Read the test output from the following assert and let that drive you to
    #          adding the link in Step 18
    click_link "Add task"
    # Step 19: Let the test output from the following actions drive you to create a new view, with a form
    #          In the new_task view action (steps 20-23).
    #
    #          At some point you will feel stuck because the test output doesn't have any errors.
    #          When this happens, open the screenshot whose location is printed out in the logs
    #          and look at the test screenshot for this test.
    #
    #          When you see "Not Found", that should prompt you to create a new sinatra route for
    #          `/tasks/new` (Step 20)
    #
    #          When you see a blank screen, that should prompt you to actually render something in that
    #          new route you created (Step 21)
    #
    #          When you see the contents of "app/views/tasks/new.html.erb" being rendered, that should prompt
    #          you to actually create the form (Step 22)
    fill_in "Task Description", with: "Follow the test instructions"
    click_button "Save"
    # Step 24: Let the failures that you receive when saving drive you to submit the form to a reasonable URL
    #          (Step 25) and to create the matching Sinatra route (Step 26-27)
    expect_task_list_to_be_exactly("Follow the test instructions")
  end
end
