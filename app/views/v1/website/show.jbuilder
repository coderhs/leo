json.result do
  json.domain @website.domain
  json.status @website.status
  json.result_url result_v1_website_index_url key: @website.key
  json.result JSON.parse(@website.result)
end
