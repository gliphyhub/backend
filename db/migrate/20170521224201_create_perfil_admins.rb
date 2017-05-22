class CreatePerfilAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :perfil_admins do |t|
      t.belongs_to :user, foreign_key: true,unique: true,index:{unique: true}
      t.string :nss
      t.string :ap_paterno
      t.string :ap_materno
      t.string :nombre
      t.date :fecha_de_nacimiento
      t.belongs_to :genero, foreign_key: true
      t.string :calle
      t.string :numero_exterior
      t.string :numero_interior
      t.string :colonia
      t.string :delegacion_municipio
      t.string :codigo_postal
      t.string :telefono_casa
      t.string :telefono_celular
      t.string :telefono_recados
      t.string :extension_recados

      t.timestamps
    end
  end
end
