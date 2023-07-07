class Url < ApplicationRecord
  validates :original_url, presence: true, format: { with: URI::regexp(%w[http https]), message: 'must be a valid URL' }
  validates :short_url, uniqueness: true
end
