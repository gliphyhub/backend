json.extract! publicacion, :id, :titulo, :mensaje, :fecha_de_termino, :prioridad, :created_at, :updated_at
json.url publicacion_url(publicacion, format: :json)
