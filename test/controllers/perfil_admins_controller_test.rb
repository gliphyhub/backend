require 'test_helper'

class PerfilAdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @perfil_admin = perfil_admins(:one)
  end

  test "should get index" do
    get perfil_admins_url
    assert_response :success
  end

  test "should get new" do
    get new_perfil_admin_url
    assert_response :success
  end

  test "should create perfil_admin" do
    assert_difference('PerfilAdmin.count') do
      post perfil_admins_url, params: { perfil_admin: { ap_materno: @perfil_admin.ap_materno, ap_paterno: @perfil_admin.ap_paterno, calle: @perfil_admin.calle, codigo_postal: @perfil_admin.codigo_postal, colonia: @perfil_admin.colonia, delegacion_municipio: @perfil_admin.delegacion_municipio, extension_recados: @perfil_admin.extension_recados, fecha_de_nacimiento: @perfil_admin.fecha_de_nacimiento, genero_id: @perfil_admin.genero_id, nombre: @perfil_admin.nombre, nss: @perfil_admin.nss, numero_exterior: @perfil_admin.numero_exterior, numero_interior: @perfil_admin.numero_interior, telefono_casa: @perfil_admin.telefono_casa, telefono_celular: @perfil_admin.telefono_celular, telefono_recados: @perfil_admin.telefono_recados, user_id: @perfil_admin.user_id } }
    end

    assert_redirected_to perfil_admin_url(PerfilAdmin.last)
  end

  test "should show perfil_admin" do
    get perfil_admin_url(@perfil_admin)
    assert_response :success
  end

  test "should get edit" do
    get edit_perfil_admin_url(@perfil_admin)
    assert_response :success
  end

  test "should update perfil_admin" do
    patch perfil_admin_url(@perfil_admin), params: { perfil_admin: { ap_materno: @perfil_admin.ap_materno, ap_paterno: @perfil_admin.ap_paterno, calle: @perfil_admin.calle, codigo_postal: @perfil_admin.codigo_postal, colonia: @perfil_admin.colonia, delegacion_municipio: @perfil_admin.delegacion_municipio, extension_recados: @perfil_admin.extension_recados, fecha_de_nacimiento: @perfil_admin.fecha_de_nacimiento, genero_id: @perfil_admin.genero_id, nombre: @perfil_admin.nombre, nss: @perfil_admin.nss, numero_exterior: @perfil_admin.numero_exterior, numero_interior: @perfil_admin.numero_interior, telefono_casa: @perfil_admin.telefono_casa, telefono_celular: @perfil_admin.telefono_celular, telefono_recados: @perfil_admin.telefono_recados, user_id: @perfil_admin.user_id } }
    assert_redirected_to perfil_admin_url(@perfil_admin)
  end

  test "should destroy perfil_admin" do
    assert_difference('PerfilAdmin.count', -1) do
      delete perfil_admin_url(@perfil_admin)
    end

    assert_redirected_to perfil_admins_url
  end
end
