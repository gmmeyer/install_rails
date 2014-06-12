class Prompt < ActiveRecord::Migration
  def change
    add_column :steps, :prompt, :string
    add_column :steps, :button_text, :string
  end
end
