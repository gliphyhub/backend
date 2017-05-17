class CreateProfesorGrupos < ActiveRecord::Migration[5.0]
  def change
    create_table :profesor_grupos do |t|
      t.belongs_to :perfil_profesor, foreign_key: true
      t.belongs_to :grupo, foreign_key: true

      t.timestamps
    end
  end
end
