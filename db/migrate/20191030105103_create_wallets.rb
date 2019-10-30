class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.bigint :wallatable_id
      t.string :wallatable_type
      t.timestamps
    end

    add_index :wallets, [:wallatable_type, :wallatable_id], unique: true
  end
end
