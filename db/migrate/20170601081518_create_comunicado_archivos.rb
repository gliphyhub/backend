class CreateComunicadoArchivos < ActiveRecord::Migration[5.0]
  def change
    create_table :comunicado_archivos do |t|
      t.belongs_to :admin_publicacion, foreign_key: true
      t.string :nombre
      t.string :ruta

      t.timestamps
    end
  end
end
