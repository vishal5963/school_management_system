class TeacherController < ApplicationController

  def new_student
    @student = User.new
  end


  def create_student

      @student = User.new
      @student.email = params[:email]
      @student.password = params[:email].split("@")[0]+"123"
      @student.role_id = 1
      @student.teacher_id = current_user.id
p @student
    respond_to do |format|
    if @student.save
      format.html { redirect_to root_path, notice: 'Health official was successfully created.' }
      #format.json { render :show, status: :created, location: @student }
    else
      p @student.errors
      format.html { render :new_student }
      format.json { render json: @student.errors, status: :unprocessable_entity }
    end
  end
  end
















  private
  def health_official_params
    params.require(:user).permit(:email)
  end
end
