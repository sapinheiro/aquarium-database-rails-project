require 'test_helper'

class HabitatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @habitat = habitats(:one)
  end

  test "should get index" do
    get habitats_url
    assert_response :success
  end

  test "should get new" do
    get new_habitat_url
    assert_response :success
  end

  test "should create habitat" do
    assert_difference('Habitat.count') do
      post habitats_url, params: { habitat: { description: @habitat.description, habitat_id: @habitat.habitat_id, name: @habitat.name, year_added: @habitat.year_added } }
    end

    assert_redirected_to habitat_url(Habitat.last)
  end

  test "should show habitat" do
    get habitat_url(@habitat)
    assert_response :success
  end

  test "should get edit" do
    get edit_habitat_url(@habitat)
    assert_response :success
  end

  test "should update habitat" do
    patch habitat_url(@habitat), params: { habitat: { description: @habitat.description, habitat_id: @habitat.habitat_id, name: @habitat.name, year_added: @habitat.year_added } }
    assert_redirected_to habitat_url(@habitat)
  end

  test "should destroy habitat" do
    assert_difference('Habitat.count', -1) do
      delete habitat_url(@habitat)
    end

    assert_redirected_to habitats_url
  end
end
