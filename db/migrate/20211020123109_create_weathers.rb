class CreateWeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :weathers do |t|
      t.string :city, null: false, default: ""
      t.text :note
      t.decimal :temp

      t.timestamps
    end
  end
end
