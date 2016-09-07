Rails.application.routes.draw do
  api_version(:module => "V1", :path => {:value => "v1"}, :defaults => {:format => "json"}) do
    resources :website, only: [:index, :create] do
      collection do
        match ':domain_name', to: 'website#show', via: [:get], as: 'result'
      end
    end
  end
end
