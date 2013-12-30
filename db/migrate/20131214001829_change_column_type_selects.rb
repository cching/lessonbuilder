class ChangeColumnTypeSelects < ActiveRecord::Migration
  def up
        change_column :selects, :notes, :text, :default => "1. Learning Objective.
Check for Understanding; what are we going to do today? What are we going to (skill)

2. Activate Prior Knowledge.
Check for Understanding
Connection to new learning

3. Concept Development
Provide written definitions and examples.
Cognitive Strategies
Check for Understanding

4. Skill Development/Guided Practice
Strategic Steps
Provide matched teacher/student problems
Check for understanding

5. Relevance
Provide reasons with examples
Check for Understanding

6. Closure
Concept
Skill

7. Summary Closure; what did you learn today about _____

8. Independent Practice"
                change_column :selects, :objective, :text, :default => ""
  end

  def down
            change_column :selects, :objective, :string, :default => ""
  end
end