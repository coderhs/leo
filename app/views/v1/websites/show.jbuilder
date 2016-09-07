json.result do
  json.domain @website.domain
  json.status @website.status
  json.result_url result_v1_websites_url key: @website.key
  json.result JSON.parse(@website.result)
end
