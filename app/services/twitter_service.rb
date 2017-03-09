class TwitterService
  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_SECRET"]
    end
  end

  def self.urls
    tweets = self.client.home_timeline(count: 200)
    tweets.map do |tweet|
      # "#{tweet.user.screen_name}: #{tweet.text}"
      m = tweet.text.match(/https?:\/\/[\S]*/)
      m[0] if m
    end
  end
end
