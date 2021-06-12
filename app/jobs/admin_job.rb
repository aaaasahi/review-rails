class AdminJob < ApplicationJob
  queue_as :default

  def perform(msg)
    User.all.each do |user|
      AdminMailer.notify(user, msg).deliver_later
    end
  end
end
