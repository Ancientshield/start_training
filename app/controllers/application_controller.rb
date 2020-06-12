# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authorize, :set_locale
  around_action :switch_locale
  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  # 設定語系
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # 語系切換
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  # 使用者選擇語系後可持續在其他頁面使用該語系
  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  # 從子網域取得locale code
  def extract_locale_from_tld
    parsed_locale = request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
    parsed_locale : nil
  end

  private

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: 'Please log in'
    end
  end
end
