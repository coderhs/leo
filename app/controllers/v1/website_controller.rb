class V1::WebsiteController < V1::BaseController
  def create
    @website = Website.new(website_params)
    if @website.save
      ScraperJob.perform_later(@website)
      render 'create'
    else
      render json: {error: @website.errors.full_messages.to_sentence}, status: 500
    end
  end

  def show
    @website = Website.where(key: params[:key]).first!
  end

  def index

  end

  private

  def website_params
    params.permit(:domain)
  end
end
