class CreatePublicaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :publicaciones do |t|
      t.string :titulo
      t.text :mensaje
      t.date :fecha_de_termino
      t.boolean :prioridad
      t.belongs_to :color, foreign_key: true

      t.timestamps
    end
  end
end
