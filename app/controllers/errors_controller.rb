class ErrorsController < ApplicationController
  protect_from_forgery except: :all
  def error_404

    @exception = env["action_dispatch.exception"]
    respond_to do |format|
      format.html { render action: request.path[1..-1] }
      format.json { render json: {status: request.path[1..-1], error: @exception.message} }
    end

  end

  def page_not_found
    respond_to do |format|
      format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def server_error
    respond_to do |format|
      format.html { render template: 'errors/not_found_error', layout: 'layouts/error', status: 500 }
      format.all  { render nothing: true, status: 500}
    end
  end
end