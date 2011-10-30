module Lanyrd
  class Client
    def search(query)
      get "search/?q=#{query}"
    end

    def popular
      get "popular/"
    end

    def event(id)
      get "event/#{id}/"
    end

    def speakers(event_id)
      get "speakers/#{event_id}/"
    end

    def attendees(event_id)
      get "attendees/#{event_id}/"
    end

    def get(path)
      response = conenction.get path
      decode response.body
    end

    def decode(data)
      plist = CFPropertyList::List.new(:data => data)
      CFPropertyList.native_types(plist.value)
    end

    def conenction
      Faraday.new(:url => 'http://lanyrd.com/mobile/ios/')
    end
  end
end