class CreateOperatingSystems < ActiveRecord::Migration
  def change
    create_table :operating_systems do |t|
      t.string :brand
      t.string :version

      t.timestamps
    end
  end
end
