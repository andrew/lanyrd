module Lanyrd
  class Client
    def search(query)
      get "search/?q=#{query}"
    end

    def popular
      get "search/"
    end

    def event(slug, year = Time.now.year)
      get "#{year}/#{slug}/"
    end

    def speakers(slug, year = Time.now.year)
      get "#{year}/#{slug}/speakers/"
    end

    def attendees(slug, year = Time.now.year)
      get "#{year}/#{slug}/attendees/"
    end
    
    def schedule(slug, year = Time.now.year)
      get "#{year}/#{slug}/schedule/"
    end
    
    def profile(username)
      get "profile/#{username}/"
    end

    private

    def get(path)
      response = connection.get path
      decode response.body
    end

    def decode(data)
      JSON.parse(data)
    end

    def connection
      Faraday.new(:url => 'http://lanyrd.com/mobile/ios2/')
    end
  end
end