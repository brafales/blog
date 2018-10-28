class RefreshGifWorker
  include Sidekiq::Worker

  def perform(article_id)
    article = Article.find(article_id)
    gif_url = GifFinderService.new(article.title).run
    article.update_attributes(gif_url: gif_url)
    # To generate some background jobs we simply refresh every minute
    RefreshGifWorker.perform_in(1.minute, article_id)
  end
end
