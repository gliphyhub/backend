json.extract! comunicado, :id, :titulo, :mensaje, :mensaje_markdown, :fecha_de_termino, :prioridad, :perfil_admin_id, :created_at, :updated_at
json.url comunicado_url(comunicado, format: :json)
