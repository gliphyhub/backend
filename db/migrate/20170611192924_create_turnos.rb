class CreateTurnos < ActiveRecord::Migration[5.0]
  def change
    create_table :turnos do |t|
      t.string :turno
      #t.timestamps
    end
  end
end
