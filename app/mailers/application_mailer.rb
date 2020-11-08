class ApplicationMailer < ActionMailer::Base
  default from: Rails.configuration.x.admin.email
  layout 'mailer'
end
