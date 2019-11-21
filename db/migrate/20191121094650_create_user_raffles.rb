class CreateUserRaffles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_raffles do |t|
      t.references :user, foreign_key: true
      t.references :raffle, foreign_key: true

      t.timestamps
    end
    add_index :user_raffles, [:user_id, :raffle_id], unique: true
  end
end
