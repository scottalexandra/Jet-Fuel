class Url < ActiveRecord::Base
  validates :long, presence: true
  def create_short_url
    self.short = "http://al.x/" + Digest::SHA256.hexdigest(long)[0..3]
  end

  def increment_count
    self.count += 1
    save
  end
end
