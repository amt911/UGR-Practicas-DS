require "test_helper"

class UsuarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "El usuario no es admin por defecto" do
    usuario = Usuario.new
    assert_not usuario.admin?
  end

  test "El usuario tiene su nombre correcto" do
    assert_equal "tiopaco" , usuarios(:UsuarioPrueba).nombre
  end

  test "El usuario tiene su id correcto" do
    assert_equal 69 , usuarios(:UsuarioPrueba).id
  end
end
