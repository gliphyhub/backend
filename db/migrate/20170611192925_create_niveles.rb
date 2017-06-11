class CreateNiveles < ActiveRecord::Migration[5.0]
  def change
    create_table :niveles do |t|
      t.string :nivel
      #t.timestamps
    end
  end
end
