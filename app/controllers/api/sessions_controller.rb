class Api::SessionsController < ApiController


  def create
    request.headers['X-CSRF-Token'] = form_authenticity_token
    print request
  end

end