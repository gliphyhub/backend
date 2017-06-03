class CreateComunicadoGrupos < ActiveRecord::Migration[5.0]
  def change
    create_table :comunicado_grupos do |t|
      t.belongs_to :grupo, foreign_key: true
      t.belongs_to :comunicado, foreign_key: true

      t.timestamps
    end
  end
end
