class CreateTipos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipos do |t|
      t.string :tipo_de_usuario
      #t.timestamps
    end
  end
end
