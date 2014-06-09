class CreateInstallSteps < ActiveRecord::Migration
  def change
    create_table :install_steps do |t|
      t.integer :operating_system_id
      t.integer :step_id
      t.integer :step_number

      t.timestamps
    end
  end
end
