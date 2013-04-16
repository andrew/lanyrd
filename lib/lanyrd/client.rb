module Lanyrd
  class Client

    # Specify search term with params.
    # Params include :topic => topic
    def search(query, params = {})
      params = URI.escape(params.collect{|k,v| "#{k}=#{v}"}.join('&')).insert 0, "&"
      get("search/?q=#{query}#{params}")['sections'][0]['rows']
    end

    def popular
      get("search/")['sections'][0]['rows']
    end

    def event(slug, year = Time.now.year)
      get("#{year}/#{slug}/")
    end

    def speakers(slug, year = Time.now.year)
      get_rows(get("#{year}/#{slug}/speakers/")["sections"])
    end

    def attendees(slug, year = Time.now.year)
      get_rows(get("#{year}/#{slug}/attendees/")['sections'])
    end

    def schedule(slug, year = Time.now.year)
      get_rows(get("#{year}/#{slug}/schedule/")['sections'])
    end

    def profile(username)
      get("profile/#{username}/")
    end

    def future_events(username)
      get("profile/#{username}/action/")['events']
    end

    private

    def get(path)
      response = connection.get(path).body
    end

    def connection
      conn = Faraday.new 'http://lanyrd.com/mobile/ios2/' do |conn|
        conn.response :json
        conn.use FaradayMiddleware::Mashify
        conn.adapter Faraday.default_adapter
      end

      # iPhone App HTTP Headers
      conn.headers['X-Lanyrd-Auth'] = Time.now.hash.to_s
      conn.headers['User-Agent'] = "Lanyrd-iOS/2.4.0 (iPhone OS 6.1.3; iPhone5,2 N42AP) build/61"
      conn.headers['X-Lanyrd-Protocol'] = "4"
      conn.headers['X-Lanyrd-Hardware'] = "320x568@2"
      conn.headers['X-Lanyrd-DeviceID'] = "Device-String"
      conn.headers['X-Lanyrd-PushEnvironment'] = "ios-production"
      conn.headers['x-mycustomurl-intercept'] = "api"
      
      conn
    end

    def get_rows(section_list)
      rows = []
      section_list.each {|s| rows.concat(s["rows"])}
      rows
    end
  end
end
