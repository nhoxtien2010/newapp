class SettingController < ApplicationController

  def change_locale
    lc = params[:locale].to_s.strip.to_sym
    # I18n.locale = lc
    session[:locale] = lc
    render :js => "document.location.reload()"
  end
end
