class CreateMaterias < ActiveRecord::Migration[5.0]
  def change
    create_table :materias do |t|
      t.string :materia
      t.belongs_to :nivel, foreign_key: true
      t.belongs_to :grado, foreign_key: true
      t.belongs_to :color, foreign_key: true

      t.timestamps
    end
  end
end
