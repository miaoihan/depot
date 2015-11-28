class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, :precision => 8, :scale => 2#八位有效数，小数点后两位

      t.timestamps null: false
    end
  end
    def self.down
      drop_table :products
    end
end
