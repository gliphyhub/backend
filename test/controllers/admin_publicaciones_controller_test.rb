require 'test_helper'

class AdminPublicacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_publicacion = admin_publicaciones(:one)
  end

  test "should get index" do
    get admin_publicaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_publicacion_url
    assert_response :success
  end

  test "should create admin_publicacion" do
    assert_difference('AdminPublicacion.count') do
      post admin_publicaciones_url, params: { admin_publicacion: { fecha_de_termino: @admin_publicacion.fecha_de_termino, mensaje: @admin_publicacion.mensaje, mensaje_markdown: @admin_publicacion.mensaje_markdown, perfil_admin_id: @admin_publicacion.perfil_admin_id, prioridad: @admin_publicacion.prioridad, titulo: @admin_publicacion.titulo } }
    end

    assert_redirected_to admin_publicacion_url(AdminPublicacion.last)
  end

  test "should show admin_publicacion" do
    get admin_publicacion_url(@admin_publicacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_publicacion_url(@admin_publicacion)
    assert_response :success
  end

  test "should update admin_publicacion" do
    patch admin_publicacion_url(@admin_publicacion), params: { admin_publicacion: { fecha_de_termino: @admin_publicacion.fecha_de_termino, mensaje: @admin_publicacion.mensaje, mensaje_markdown: @admin_publicacion.mensaje_markdown, perfil_admin_id: @admin_publicacion.perfil_admin_id, prioridad: @admin_publicacion.prioridad, titulo: @admin_publicacion.titulo } }
    assert_redirected_to admin_publicacion_url(@admin_publicacion)
  end

  test "should destroy admin_publicacion" do
    assert_difference('AdminPublicacion.count', -1) do
      delete admin_publicacion_url(@admin_publicacion)
    end

    assert_redirected_to admin_publicaciones_url
  end
end
