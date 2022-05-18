class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: "Новая подписка на #{event.title}"
  end

  def comment(comment, email)
    @comment = comment

    mail to: email, subject: "Новый комментарий в #{comment.event.title}"
  end
end
