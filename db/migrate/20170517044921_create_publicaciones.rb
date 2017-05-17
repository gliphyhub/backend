class CreatePublicaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :publicaciones do |t|
      t.string :titulo
      t.text :mensaje
      t.date :fecha_de_termino
      t.boolean :prioridad

      t.timestamps
    end
  end
end
