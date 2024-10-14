class Url < ApplicationRecord
  before_create :generate_short_url

  validates :original_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }

  private

  def generate_short_url
    self.short_url = SecureRandom.alphanumeric(6)
  end
end

