require 'test_helper'

class PerfilTutoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @perfil_tutor = perfil_tutores(:one)
  end

  test "should get index" do
    get perfil_tutores_url
    assert_response :success
  end

  test "should get new" do
    get new_perfil_tutor_url
    assert_response :success
  end

  test "should create perfil_tutor" do
    assert_difference('PerfilTutor.count') do
      post perfil_tutores_url, params: { perfil_tutor: { ap_materno: @perfil_tutor.ap_materno, ap_paterno: @perfil_tutor.ap_paterno, calle: @perfil_tutor.calle, codigo_postal: @perfil_tutor.codigo_postal, colonia: @perfil_tutor.colonia, delegacion_municipio: @perfil_tutor.delegacion_municipio, extension_recados: @perfil_tutor.extension_recados, fecha_de_nacimiento: @perfil_tutor.fecha_de_nacimiento, genero_id: @perfil_tutor.genero_id, nombre: @perfil_tutor.nombre, numero_exterior: @perfil_tutor.numero_exterior, numero_interior: @perfil_tutor.numero_interior, telefono_casa: @perfil_tutor.telefono_casa, telefono_celular: @perfil_tutor.telefono_celular, telefono_recados: @perfil_tutor.telefono_recados, user_id: @perfil_tutor.user_id } }
    end

    assert_redirected_to perfil_tutor_url(PerfilTutor.last)
  end

  test "should show perfil_tutor" do
    get perfil_tutor_url(@perfil_tutor)
    assert_response :success
  end

  test "should get edit" do
    get edit_perfil_tutor_url(@perfil_tutor)
    assert_response :success
  end

  test "should update perfil_tutor" do
    patch perfil_tutor_url(@perfil_tutor), params: { perfil_tutor: { ap_materno: @perfil_tutor.ap_materno, ap_paterno: @perfil_tutor.ap_paterno, calle: @perfil_tutor.calle, codigo_postal: @perfil_tutor.codigo_postal, colonia: @perfil_tutor.colonia, delegacion_municipio: @perfil_tutor.delegacion_municipio, extension_recados: @perfil_tutor.extension_recados, fecha_de_nacimiento: @perfil_tutor.fecha_de_nacimiento, genero_id: @perfil_tutor.genero_id, nombre: @perfil_tutor.nombre, numero_exterior: @perfil_tutor.numero_exterior, numero_interior: @perfil_tutor.numero_interior, telefono_casa: @perfil_tutor.telefono_casa, telefono_celular: @perfil_tutor.telefono_celular, telefono_recados: @perfil_tutor.telefono_recados, user_id: @perfil_tutor.user_id } }
    assert_redirected_to perfil_tutor_url(@perfil_tutor)
  end

  test "should destroy perfil_tutor" do
    assert_difference('PerfilTutor.count', -1) do
      delete perfil_tutor_url(@perfil_tutor)
    end

    assert_redirected_to perfil_tutores_url
  end
end
