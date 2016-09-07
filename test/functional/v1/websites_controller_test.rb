require 'test_helper'

class V1::WebsitesControllerTest < ActionController::TestCase

  test 'submit domain for scraping' do
    assert_difference('Website.count') do
      post :create, params: { domain: "https://simple.wikipedia.org/wiki/Wikipedia" }
    end
    assert_equal JSON.parse(response.body)["result"]["status"], 'PENDING'
  end

  test 'submitting domain twice for scraping' do
    2.times do
      post :create, params: { domain: "https://simple.wikipedia.org/wiki/Wikipedia" }
    end
    assert_equal response.status, 500
  end

  test 'response should have required keys' do
    post :create, params: { domain: "https://simple.wikipedia.org/wiki/Wikipedia" }
    json_response = JSON.parse(response.body)
    assert_equal json_response.keys, ['result']
    assert_equal json_response['result'].keys, ['domain', 'status', 'result_url']
  end

  test '/websites to return all website' do
    get :index
    assert_equal response.status, 200
  end
end
