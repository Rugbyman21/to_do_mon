require("rspec")
require("pg")
require("task")
require("spec_helper")

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(Task) do
  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL", :list_id => "list_id"})
      task2 = Task.new({:description => "learn SQL", :list_id => "list_id"})
      expect(task1).to(eq(task2))
    end
  end
end

describe(".all") do
  it("is empty at first") do
    expect(Task.all()).to(eq([]))
  end
end
