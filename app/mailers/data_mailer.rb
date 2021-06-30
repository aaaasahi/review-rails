class DataMailer < ApplicationMailer
  
  def report
    @published_article_count = Article.count
    @article_published_yesterday = Article.where(created_at: 1.day.ago.all_day)
    mail(to:'admin@example.com', subject: '公開済記事の集計結果')
  end
end