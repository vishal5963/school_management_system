require 'test_helper'

class TeacherControllerTest < ActionDispatch::IntegrationTest
  test "should get add_student" do
    get teacher_add_student_url
    assert_response :success
  end

  test "should get create_student" do
    get teacher_create_student_url
    assert_response :success
  end

end
