module ErrorHandlers
  extend ActiveSupport::Concern

#StandardErrorがあったら、rescue500メソッドを呼び出す
included do
  rescue_from StandardError, with: :rescue500
  rescue_from Forbidden, with: :rescue403
  rescue_from IpAddressRejected, with: :rescue403
  rescue_from ActiveRecord::RecordNotFound, with: :rescue404
end

# Forbiddenエラーがあったときに呼び出されるメソッド
private def rescue403(e)
  @exception = e
  render "errors/forbidden", status: 403
end

# RecordNotFoundエラーがあったときに呼び出されるメソッド
private def rescue404(e)
	render "errors/not_found", status: 404
end

#StandardErrorがあったときに表示されるページの設定
private def rescue500(e)
	render "errors/internal_server_error", status: 500
end