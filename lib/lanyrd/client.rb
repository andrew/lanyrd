module Lanyrd
  class Client
    def search(query)
      get("search/?q=#{query}")['sections'][0]['rows']
    end

    def popular
      get("search/")['sections'][0]['rows']
    end

    def event(slug, year = Time.now.year)
      get("#{year}/#{slug}/")
    end

    def speakers(slug, year = Time.now.year)
      get("#{year}/#{slug}/speakers/")['sections'][0]['rows']
    end

    def attendees(slug, year = Time.now.year)
      get("#{year}/#{slug}/attendees/")['sections'][0]['rows']
    end

    def schedule(slug, year = Time.now.year)
      get("#{year}/#{slug}/schedule/")['sections'][0]['rows']
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
      Faraday.new 'http://lanyrd.com/mobile/ios2/' do |conn|
        conn.response :json
        conn.use FaradayMiddleware::Mashify
        conn.adapter Faraday.default_adapter
      end
    end
  end
end