# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  has_one_attached :eyecatch

  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy

  def author_name
    user.display_name
  end

  def like_count
    likes.count
  end


  # 日付表示
  def display_created_at
    I18n.l(created_at, format: :default)
  end
end
