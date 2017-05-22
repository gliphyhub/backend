require 'test_helper'

class PerfilProfesoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @perfil_profesor = perfil_profesores(:one)
  end

  test "should get index" do
    get perfil_profesores_url
    assert_response :success
  end

  test "should get new" do
    get new_perfil_profesor_url
    assert_response :success
  end

  test "should create perfil_profesor" do
    assert_difference('PerfilProfesor.count') do
      post perfil_profesores_url, params: { perfil_profesor: { ap_materno: @perfil_profesor.ap_materno, ap_paterno: @perfil_profesor.ap_paterno, calle: @perfil_profesor.calle, codigo_postal: @perfil_profesor.codigo_postal, colonia: @perfil_profesor.colonia, delegacion_municipio: @perfil_profesor.delegacion_municipio, extension_recados: @perfil_profesor.extension_recados, fecha_de_nacimiento: @perfil_profesor.fecha_de_nacimiento, genero_id: @perfil_profesor.genero_id, nombre: @perfil_profesor.nombre, nss: @perfil_profesor.nss, numero_exterior: @perfil_profesor.numero_exterior, numero_interior: @perfil_profesor.numero_interior, telefono_casa: @perfil_profesor.telefono_casa, telefono_celular: @perfil_profesor.telefono_celular, telefono_recados: @perfil_profesor.telefono_recados, user_id: @perfil_profesor.user_id } }
    end

    assert_redirected_to perfil_profesor_url(PerfilProfesor.last)
  end

  test "should show perfil_profesor" do
    get perfil_profesor_url(@perfil_profesor)
    assert_response :success
  end

  test "should get edit" do
    get edit_perfil_profesor_url(@perfil_profesor)
    assert_response :success
  end

  test "should update perfil_profesor" do
    patch perfil_profesor_url(@perfil_profesor), params: { perfil_profesor: { ap_materno: @perfil_profesor.ap_materno, ap_paterno: @perfil_profesor.ap_paterno, calle: @perfil_profesor.calle, codigo_postal: @perfil_profesor.codigo_postal, colonia: @perfil_profesor.colonia, delegacion_municipio: @perfil_profesor.delegacion_municipio, extension_recados: @perfil_profesor.extension_recados, fecha_de_nacimiento: @perfil_profesor.fecha_de_nacimiento, genero_id: @perfil_profesor.genero_id, nombre: @perfil_profesor.nombre, nss: @perfil_profesor.nss, numero_exterior: @perfil_profesor.numero_exterior, numero_interior: @perfil_profesor.numero_interior, telefono_casa: @perfil_profesor.telefono_casa, telefono_celular: @perfil_profesor.telefono_celular, telefono_recados: @perfil_profesor.telefono_recados, user_id: @perfil_profesor.user_id } }
    assert_redirected_to perfil_profesor_url(@perfil_profesor)
  end

  test "should destroy perfil_profesor" do
    assert_difference('PerfilProfesor.count', -1) do
      delete perfil_profesor_url(@perfil_profesor)
    end

    assert_redirected_to perfil_profesores_url
  end
end
