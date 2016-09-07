json.result do
  json.domain @website.domain
  json.status @website.status
  json.result_url result_v1_website_index_url domain_name: @website.key
end
