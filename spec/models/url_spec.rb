require "rails_helper"

RSpec.describe Url, type: :model do
  it "can have a short url created from long url" do
    @url = Url.new(long: "http://google.com")
    @url.create_short_url
    expect(@url.short).to eq("http://al.x/aa22")
  end

  it "can have count incremented" do
    @url = Url.new(long: "http://google.com")
    expect(@url.count).to eq(0)
    2.times do
      @url.increment_count
    end
    expect(@url.count).to eq(2)
  end
end
