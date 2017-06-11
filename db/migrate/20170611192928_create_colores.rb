class CreateColores < ActiveRecord::Migration[5.0]
  def change
    create_table :colores do |t|
      t.string :color
      t.string :descripcion

      t.timestamps
    end
  end
end
