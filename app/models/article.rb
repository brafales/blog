class Article < ApplicationRecord
  validates :title, presence: true
  before_save ->() { self.gif_url = GifFinderService.new(self.title).run }
end
