class AccountController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  # If you want "remember me" functionality, add this before_filter to Application Controller
  before_filter :login_from_cookie
  # say something nice, you goof!  something sweet.
  def index
    redirect_to :action=>"login"
  end
  def login
    #return unless request.post?
    self.current_user = User.authenticate(params[:login], params[:password])
    if session[:id]!=nil
      redirect_to :controller=>"manage",:action=>"home"
    else if logged_in?
      session[:id]=self.current_user[:id]
      session[:name]=self.current_user[:login]
      redirect_to :controller=>"manage",:action=>"home"
      flash[:notice] = "Logged in successfully"
    end
    end
  end
  def signup
    @user = User.new(params[:user])
    return unless request.post?
    @user.save!
    self.current_user = @user
    redirect_back_or_default(:controller => '/account', :action => 'index')
    flash[:notice] = "Thanks for signing up!"
  rescue ActiveRecord::RecordInvalid
    render :action => 'signup'
  end
  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default(:controller => '/account', :action => 'index')
  end
end
