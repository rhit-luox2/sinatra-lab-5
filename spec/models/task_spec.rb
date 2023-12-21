require_relative "../spec_helper"

describe "Task" do
  describe "#create" do
    describe "with valid data", skip: "Step 4 - Unskip this test.  Run `rspec spec/models/task_spec.rb` to focus on the task model" do
      before do
        Task.count.should eq 0  # Sanity check that we haven't got orphaned records hanging around
        # Step 5 - Let the error "undefined method `count' for Task:Class"
        #          drive you to the Task model to begin implementation
        #          (hint: app/models/task.rb)
        Task.create(description: 'Eat breakfast')
      end

      it "should create a task" do
        Task.count.should be 1
      end

      it "should save the description we passed in" do
        Task.first.description.should eq "Eat breakfast"
      end
    end
  end
end
