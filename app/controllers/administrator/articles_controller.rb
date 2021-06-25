class Administrator::ArticlesController < ApplicationController
  
  def index
    @articles = Article.all 
    @articles_published_at_yesterday = Article.where(created_at: 1.day.ago.all_day)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Articles",
              template: "administrator/articles/index.html.haml"
      end
    end
  end

  
end
