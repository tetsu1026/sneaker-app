class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,           null: false
      t.text       :explanation,    null: false
      t.integer    :price,          null: false
      t.integer    :size_id,        null: false
      t.integer    :brand_id,       null: false
      t.integer    :item_state_id,  null: false
      t.integer    :prefecture_id,  null: false
      t.references :user,           foreign_key:true
      t.timestamps
    end
  end
end
