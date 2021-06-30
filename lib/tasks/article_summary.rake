namespace :article_summary do
  desc '管理者に対して総記事数、昨日公開された記事数とタイトルをメールで送信'
  task mail_article_summary: :environment do
    DataMailer.report.deliver_now
  end
end
