class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,                   null: false
      t.string     :name,                   null: false
      t.text       :info,                   null: false
      t.integer    :price,                  null: false
      t.integer    :category_id,            null: false
      t.integer    :status_id,              null: false
      t.integer    :shopping_fee_status_id, null: false
      t.integer    :prefectures_id,         null: false
      t.integer    :scheduled_delivery_id,  null: false
      t.timestamps
    end
  end
end
