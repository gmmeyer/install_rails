class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      # the text is just a placeholder for the moment.
      t.text :content

      t.timestamps
    end
  end
end
