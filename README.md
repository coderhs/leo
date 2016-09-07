# README

This is an API only Ruby on Rails application used to scrape h1, h2, h3 tags and links present in a URL.

## API End Points

```
POST '/v1/websites', params: domain (submit with http/https)
GET  '/v1/wsbites/:key', a key of the job task
GET '/v1/websites', to display all the websites presently scraped
```

To make the application run faster, I have used background jobs to scrape the result. When a user
submits a domain, a job would be created. The result URL would be send as response if the job has been created. The user can check the result url for the status as well.


## Example

**Submit a domain**

```sh
# command
curl -X POST "http://localhost:3000/v1/websites?domain=https://simple.wikipedia.org/wiki/Wikipedia"
```

```json
{"result":{"domain":"https://simple.wikipedia.org/wiki/Wikipedia","status":"PENDING","result_url":"http://localhost:3000/v1/website/389b76561f52f5f0337742b68354c106"}}
```

**Fetch Result**

```sh
# command
curl http://localhost:3000/v1/websites/389b76561f52f5f0337742b68354c106
```

Result:
https://gist.github.com/coderhs/9d84b96875fa996a7a80195cbe96425f

***Display all Website***

```sh
curl http://localhost:3000/v1/websites
```

```json
[
  {
    domain: "http://csnipp.com",
    status: "COMPLETED",
    result_url: "http://localhost:3000/v1/websites/3bae0b276b4c475c1e6bd43f2266b80e"
  },
  {
    domain: "https://redpanthers.co",
    status: "COMPLETED",
    result_url: "http://localhost:3000/v1/websites/e14dd438487e385054747f1091e86a2e"
  },
  {
    domain: "https://simple.wikipedia.org/wiki/Wikipedia",
    status: "COMPLETED",
    result_url: "http://localhost:3000/v1/websites/389b76561f52f5f0337742b68354c106"
  }
]



## ToDO:

Implement Priority Queue: Presently all the scraping is done through a single queue. Which is not good when a lot of users are using our website. So we need to create a priority queue system where we can let people submit to another queue if they need something quick.

