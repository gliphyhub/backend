class CreateArchivos < ActiveRecord::Migration[5.0]
  def change
    create_table :archivos do |t|
      t.belongs_to :publicacion, foreign_key: true
      t.string :nombre
      t.string :ruta

      t.timestamps
    end
  end
end
