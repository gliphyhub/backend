class CreateMateriaGrupos < ActiveRecord::Migration[5.0]
  def change
    create_table :materia_grupos do |t|
      t.belongs_to :materia, foreign_key: true
      t.belongs_to :grupo, foreign_key: true

      t.timestamps
    end
  end
end
