class HotReadService
  def self.read(link)
    conn = Faraday.new(url: 'http://dd-hotreads.herokuapp.com/')
    conn.post '/api/v1/hotreads', {url: link.url}
  end
end
