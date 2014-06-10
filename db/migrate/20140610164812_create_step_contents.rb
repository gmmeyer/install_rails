class CreateStepContents < ActiveRecord::Migration
  def change
    create_table :step_contents do |t|
      # the text is just a placeholder for the moment.
      t.string :title
      t.string :step_name
      t.text :content

      t.timestamps
    end
  end
end
