require 'test_helper'

class PerfilAlumnosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @perfil_alumno = perfil_alumnos(:one)
  end

  test "should get index" do
    get perfil_alumnos_url
    assert_response :success
  end

  test "should get new" do
    get new_perfil_alumno_url
    assert_response :success
  end

  test "should create perfil_alumno" do
    assert_difference('PerfilAlumno.count') do
      post perfil_alumnos_url, params: { perfil_alumno: { ap_materno: @perfil_alumno.ap_materno, ap_paterno: @perfil_alumno.ap_paterno, calle: @perfil_alumno.calle, codigo_postal: @perfil_alumno.codigo_postal, colonia: @perfil_alumno.colonia, delegacion_municipio: @perfil_alumno.delegacion_municipio, extension_recados: @perfil_alumno.extension_recados, fecha_de_nacimiento: @perfil_alumno.fecha_de_nacimiento, generacion_id: @perfil_alumno.generacion_id, genero_id: @perfil_alumno.genero_id, grupo_id: @perfil_alumno.grupo_id, matricula: @perfil_alumno.matricula, nombre: @perfil_alumno.nombre, numero_exterior: @perfil_alumno.numero_exterior, numero_interior: @perfil_alumno.numero_interior, perfil_tutor_id: @perfil_alumno.perfil_tutor_id, telefono_casa: @perfil_alumno.telefono_casa, telefono_celular: @perfil_alumno.telefono_celular, telefono_recados: @perfil_alumno.telefono_recados, user_id: @perfil_alumno.user_id } }
    end

    assert_redirected_to perfil_alumno_url(PerfilAlumno.last)
  end

  test "should show perfil_alumno" do
    get perfil_alumno_url(@perfil_alumno)
    assert_response :success
  end

  test "should get edit" do
    get edit_perfil_alumno_url(@perfil_alumno)
    assert_response :success
  end

  test "should update perfil_alumno" do
    patch perfil_alumno_url(@perfil_alumno), params: { perfil_alumno: { ap_materno: @perfil_alumno.ap_materno, ap_paterno: @perfil_alumno.ap_paterno, calle: @perfil_alumno.calle, codigo_postal: @perfil_alumno.codigo_postal, colonia: @perfil_alumno.colonia, delegacion_municipio: @perfil_alumno.delegacion_municipio, extension_recados: @perfil_alumno.extension_recados, fecha_de_nacimiento: @perfil_alumno.fecha_de_nacimiento, generacion_id: @perfil_alumno.generacion_id, genero_id: @perfil_alumno.genero_id, grupo_id: @perfil_alumno.grupo_id, matricula: @perfil_alumno.matricula, nombre: @perfil_alumno.nombre, numero_exterior: @perfil_alumno.numero_exterior, numero_interior: @perfil_alumno.numero_interior, perfil_tutor_id: @perfil_alumno.perfil_tutor_id, telefono_casa: @perfil_alumno.telefono_casa, telefono_celular: @perfil_alumno.telefono_celular, telefono_recados: @perfil_alumno.telefono_recados, user_id: @perfil_alumno.user_id } }
    assert_redirected_to perfil_alumno_url(@perfil_alumno)
  end

  test "should destroy perfil_alumno" do
    assert_difference('PerfilAlumno.count', -1) do
      delete perfil_alumno_url(@perfil_alumno)
    end

    assert_redirected_to perfil_alumnos_url
  end
end
