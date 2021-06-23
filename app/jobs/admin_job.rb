class AdminJob < ApplicationJob
  queue_as :default

  task :send_emails_from_admin, ['msg'] => :environment do |task, args|
    msg = args['msg']
    if msg.present?
      NotificationFromAdminJob.perform_later(msg)
    else
      puts '送信できませんでした。メッセージを入力してくてださい。ex. rails notification:send_emails_from_admin\[こんにちは\]'
    end
  end
end
