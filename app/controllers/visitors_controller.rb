class VisitorsController < ApplicationController
  def index
    @course = Setting.course
    @emails = []
    @member = nil
    if user_signed_in?
      @member = is_org_member
      @emails = session_octokit.emails
    end
  end
end
