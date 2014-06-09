class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :guest
      # I'm storing these as strings because they frequently come in the flavor: x.x.x, which will not (I think) store as a proper number.
      t.string :os
      t.string :os_version
      t.string :ruby_version
      t.string :rails_version


      t.timestamps
    end
  end
end
