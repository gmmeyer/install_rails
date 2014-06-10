class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :previous_step_id
      t.integer :step_content_id
      t.boolean :final_step
      t.string :choice

      t.timestamps
    end
  end
end
