Rails.application.routes.draw do
  api_version(:module => "V1", :path => {:value => "v1"}, :defaults => {:format => "json"}) do
    resources :websites, only: [:index, :create] do
      collection do
        match ':key', to: 'website#show', via: [:get], as: 'result'
      end
    end
  end
end
