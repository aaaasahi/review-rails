namespace :change_status do
  desc "記事の日付か過ぎたらstatusを変更する"
  task change_status: :environment do
    Article.where('date < ?', Date.today).where(status: false).update(status: true)
  end
end

