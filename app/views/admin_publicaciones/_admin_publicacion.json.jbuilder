json.extract! admin_publicacion, :id, :titulo, :mensaje, :mensaje_markdown, :fecha_de_termino, :prioridad, :perfil_admin_id, :created_at, :updated_at
json.url admin_publicacion_url(admin_publicacion, format: :json)
