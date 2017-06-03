class CreatePublicaciones < ActiveRecord::Migration[5.0]
  def change
    create_table :publicaciones do |t|
      t.string :titulo
      t.text :mensaje
      t.text :mensaje_markdown
      t.date :fecha_de_termino
      t.integer :visitas, default: 0
      t.belongs_to :perfil_profesor
      t.belongs_to :materia

      t.timestamps
    end
  end
end
