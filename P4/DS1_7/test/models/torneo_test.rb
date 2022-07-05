require "test_helper"

class TorneoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "El torneo no se crea con valores nulos" do
    torneo = Torneo.new
    assert_not torneo.nombre
  end
end
