class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  before_action :allow_cors

  def allow_cors
   headers["Access-Control-Allow-Origin"] = request.env['HTTP_ORIGIN'] || '*'
   headers["Access-Control-Allow-Credentials"] = 'true'
   headers['Access-Control-Request-Method'] = 'GET, DELETE, POST, PUT, OPTIONS'
  end

  def authenticate_user_from_tokren!
    token = params[:auth_token].presence
    if !user_signed_in?
      if token && user = User.find_by_auth_token(token.to_s)
        sign_in user, store: true
      else
        respond_to do |format|
          format.json{ head :unauthorized, message: "couldn't authenticate" }
          format.html{ redirect_to(new_user_session_path, error: "You must be logged in to view this page")}
        end
      end
    end
  end

  # Devise
  before_action :reject_locked!, if: :devise_controller?

  def fallback_index_html
    if /tracks\/new/.match(params[:path])
      headers['X-Frame-Options'] = "ALLOWALL"
    end
    
    render :react_wrapper, layout: false
  end

  # Redirects on successful sign in
  def after_sign_in_path_for(resource)
    # resource.admin? ? rails_admin.dashboard_path : root_path
    root_path
  end

  # Auto-sign out locked users
  def reject_locked!
    if current_user && current_user.locked?
      sign_out current_user
      flash[:alert] = "Your account is locked."
      flash[:notice] = nil
      redirect_to root_url
    end
  end
  helper_method :reject_locked!

  # Only permits admin users
  def require_admin!
    authenticate_user!

    if current_user && !current_user.admin?
      redirect_to root_path
    end
  end
  helper_method :require_admin!

  # /Devise


  # HELPERS

  # move out of here!!! -> in helpers maybe?
  def all_tags context = :tags
    ActsAsTaggableOn::Tagging.where(context: context).select(:tag_id).distinct.includes(:tag).map(&:tag)
  end
end
