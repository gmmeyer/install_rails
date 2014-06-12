class Mixpanel < ActiveRecord::Migration
  def change
    add_column :steps, :mixpanel, :string
  end
end
