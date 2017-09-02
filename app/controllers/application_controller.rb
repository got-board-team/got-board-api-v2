class ApplicationController < ActionController::API
  before_action :set_raven_context

  private

  def set_raven_context
    Raven.extra_content(params: params.to_unsafe_h, url: request.url)
  end
end
