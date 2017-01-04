module ApplicationHelper
  def anon_octokit
    Octokit::Client.new \
      :client_id => ENV['OMNIAUTH_PROVIDER_KEY'],
      :client_secret => ENV['OMNIAUTH_PROVIDER_SECRET']
  end

  def machine_octokit
    Octokit::Client.new \
      :access_token => ENV['MACHINE_USER_KEY']
  end

  def session_octokit
    token = session['oauth_token'] || ""
    if token == ""
      raise "You must be signed in"
    end
    Octokit::Client.new \
      :access_token => token
  end
end
