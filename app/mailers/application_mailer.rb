class ApplicationMailer < ActionMailer::Base
  default from: %{"Тест Гуру" <mail@test_guru.com>}
  layout 'mailer'
end
