class CreateGrupos < ActiveRecord::Migration[5.0]
  def change
    create_table :grupos do |t|
      t.string :grupo
      t.belongs_to :nivel, foreign_key: true
      t.belongs_to :grado, foreign_key: true
      t.belongs_to :turno, foreign_key: true
      #t.timestamps
    end
  end
end
