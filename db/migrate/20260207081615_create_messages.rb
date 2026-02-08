class CreateMessages < ActiveRecord::Migration[8.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :profile_id
      t.timestamps
    end
  end
end
