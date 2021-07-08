# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  date       :date
#  status     :boolean          default(FALSE)
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
  has_rich_text :content

  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy

  #validate :day_after_today
  #def day_after_today
  #    errors.add(:date, 'は、今日を含む過去の日付を入力して下さい') if date < Date.today
  #end

end
