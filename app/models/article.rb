class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  #日付表示
  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
