class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references  :order,           foreign_key: true
      t.string      :phone_number,    null: false
      t.string      :postal_code,     null: false
      t.integer     :prefectures_id,  null: false
      t.string      :city,            null: false
      t.string      :house_number,    null: false
      t.string      :building_name   
      t.timestamps
    end
  end
end
