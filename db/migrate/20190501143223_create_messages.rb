class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text     "content"
      t.references :user, foreign_key: :true
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end

end
