class CreateComunicados < ActiveRecord::Migration[5.0]
  def change
    create_table :comunicados do |t|
      t.string :titulo
      t.text :mensaje
      t.text :mensaje_markdown
      t.date :fecha_de_termino
      t.integer :visitas, default: 0
      t.boolean :prioridad
      t.belongs_to :perfil_admin, foreign_key: true

      t.timestamps
    end
  end
end
