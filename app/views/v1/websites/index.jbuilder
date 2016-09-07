json.array!(@websites) do |website|
  json.domain website.domain
  json.status website.status
  json.result_url result_v1_websites_url key: website.key
end
