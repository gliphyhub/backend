class CreateComunicadoTutores < ActiveRecord::Migration[5.0]
  def change
    create_table :comunicado_tutores do |t|
      t.belongs_to :perfil_tutor, foreign_key: true
      t.belongs_to :comunicado, foreign_key: true

      t.timestamps
    end
  end
end
