class ApplicationController < ActionController::Base
  #レイアウトをどのメソッド決めるか
  layout :set_layout

  # エラークラスを定義する
  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHanlers if Rails.env.production?

  private def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      "customer"
    end
  end
end
