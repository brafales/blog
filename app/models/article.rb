class Article < ApplicationRecord
  validates :title, presence: true
  after_create ->() { RefreshGifWorker.new.perform(self.id) }
end
