class ApplicationController < ActionController::Base
  layout :set_layout

  #StandardErrorがあったら、rescue500メソッドを呼び出す
  rescue_from StandardError, with: :rescue500

  private def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      "customer"
    end
  end

  #StandardErrorがあったときに表示されるページの設定
  private def rescue500(e)
    render "errors/internal_server_error", status: 500
  end
end
