json.extract! perfil_admin, :id, :user_id, :nss, :ap_paterno, :ap_materno, :nombre, :fecha_de_nacimiento, :genero_id, :calle, :numero_exterior, :numero_interior, :colonia, :delegacion_municipio, :codigo_postal, :telefono_casa, :telefono_celular, :telefono_recados, :extension_recados, :created_at, :updated_at
json.url perfil_admin_url(perfil_admin, format: :json)
