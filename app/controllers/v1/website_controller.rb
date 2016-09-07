class V1::WebsiteController < V1::BaseController
  def create
    @website = Website.new(website_params)
    if @website.save
      render 'create'
    else
      render json: {error: @website.errors.full_messages.to_sentence}, status: 500
    end
  end

  def show
    @website = Website.where(key: domain_name).first!
  end

  def index

  end

  private

  def website_params
    params.permit(:domain)
  end

  def domain_name
    "#{params[:domain_name]}.#{params[:format]}"
  end
end
