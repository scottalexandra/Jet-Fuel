class Url < ActiveRecord::Base
  def create_short_url
    rand_part = Digest::SHA256.hexdigest(long)[0..3]
    self.short = "https://al.x/" + rand_part
  end
end
