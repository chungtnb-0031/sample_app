class ApplicationController < ActionController::Base
  def hello
    render html: "hello, world!"
  end

  before_action :set_locale

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
