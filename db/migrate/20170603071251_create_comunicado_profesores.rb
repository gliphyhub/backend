class CreateComunicadoProfesores < ActiveRecord::Migration[5.0]
  def change
    create_table :comunicado_profesores do |t|
      t.belongs_to :perfil_profesor, foreign_key: true
      t.belongs_to :comunicado, foreign_key: true

      t.timestamps
    end
  end
end
