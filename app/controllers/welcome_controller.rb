class WelcomeController < ApplicationController
  def index
    redis_host = ENV["REDIS_HOST"]
    redis = Redis.new(host: redis_host, port: 6379)
    redis.incr "page hits"
    @page_hits = redis.get "page hits"
  end
end

