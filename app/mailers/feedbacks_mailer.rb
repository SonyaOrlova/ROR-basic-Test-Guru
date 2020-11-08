class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback)
    @feedback = feedback

    mail to: Rails.configuration.x.admin.email 
  end
end
