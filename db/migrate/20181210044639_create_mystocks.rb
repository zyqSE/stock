class CreateMystocks < ActiveRecord::Migration
  def change
    create_table :mystocks do |t|
      t.text :name
      t.string :code

      t.timestamps
    end
  end
end
