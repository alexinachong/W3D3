require 'securerandom'

class ShortenedURL < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def self.random_code
    b = SecureRandom.urlsafe_base64
    while self.exists?('short_url' => b)
      b = SecureRandom.urlsafe_base64
    end
    b
  end

  def self.gen_short_url(user, long_url)
    ShortenedURL.new('long_url' => long_url, 'short_url' => random_code, 'user_id' => user.id)
  end


end
