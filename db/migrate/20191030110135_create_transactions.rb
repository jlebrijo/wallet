class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.bigint :source_id
      t.bigint :target_id
      t.float :amount

      t.timestamps
    end
  end
end
