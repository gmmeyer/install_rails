class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      # the text is just a placeholder for the moment.
      t.string :title
      t.string :step_name
      t.text :content
      t.text :trouble
      t.string :mixpanel
      t.boolean :final_step
      t.boolean :first_step
      t.string :prompt
      t.string :permalink

      t.timestamps
    end
    add_index :steps, :permalink
  end
end
