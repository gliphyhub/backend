class CreateGeneraciones < ActiveRecord::Migration[5.0]
  def change
    create_table :generaciones do |t|
      t.string :generacion

      t.timestamps
    end
  end
end
