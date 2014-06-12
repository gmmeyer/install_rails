class Trouble < ActiveRecord::Migration
  def change
    add_column :step_contents, :trouble, :text
  end
end
