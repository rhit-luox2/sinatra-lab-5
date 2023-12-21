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
    # page.should_not have_content "There are no tasks remaining! You should add one!"
  end
end
