class CreateStepOrders < ActiveRecord::Migration
  def change
    create_table :step_orders do |t|
      t.integer :previous_step_id
      t.integer :step_id
      t.boolean :final_step

      t.timestamps
    end
  end
end
