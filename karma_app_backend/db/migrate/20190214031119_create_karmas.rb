class CreateKarmas < ActiveRecord::Migration[5.2]
  def change
    create_table :karmas do |t|
      t.string :entry
      t.datetime :date

      t.timestamps
    end
  end
end
