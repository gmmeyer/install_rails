class CreateEdges < ActiveRecord::Migration
  def change
    create_table :edges do |t|
      t.integer :previous_step_id
      t.integer :next_step_id
      t.string :choice
      t.string :os
      t.string :os_version
      t.string :rails_version
      t.string :ruby_version
      t.string :button_text
      t.boolean :single_edge

      t.timestamps
    end
  end
end
