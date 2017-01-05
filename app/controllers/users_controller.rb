class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, :except => [:index, :set_as_instructor]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def toggle_instructor_privilege
    user = User.find(params[:id])
    if is_instructor?
      if user == current_user
        redirect_to users_path, alert: "You can't change yourself"
      elsif is_instructor? user
        instructors = Setting.instructors
        instructors -= [user.username]
        Setting.instructors = instructors
        redirect_to users_path, notice: "Successfully demoted #{user.username} to non-instructor"
      else
        instructors = Setting.instructors || []
        instructors << user.username
        Setting.instructors = instructors
        redirect_to users_path, notice: "Successfully promoted #{user.username} to instructor"
      end
    else
      redirect_to users_path, alert: "You must be an instructor to elect other instructors"
    end
  end

end
