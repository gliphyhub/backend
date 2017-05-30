class CreateAdminPublicaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_publicaciones do |t|
      t.string :titulo
      t.text :mensaje
      t.text :mensaje_markdown
      t.date :fecha_de_termino
      t.boolean :prioridad
      t.belongs_to :perfil_admin, foreign_key: true

      t.timestamps
    end
  end
end
