module MovieServices

  def self.search(keyword)
    response = RestClient.get(URI::encode("http://itunes.apple.com/search?entity=movie&term=" + keyword))
    json_result = JSON.parse response.body
    puts json_result
    results = json_result["results"]
#    puts "resultados: " + results.to_json
    return results
  end
end
