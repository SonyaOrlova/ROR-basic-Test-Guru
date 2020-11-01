# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[User, Answer, Question, Test, Category].each(&:destroy_all)

admin = User.new({
  first_name: 'Admin',
  last_name: 'Admin',
  email: Rails.configuration.x.admin.email,
  password: 123456,
  type: 'Admin'
})

admin.skip_confirmation!
admin.save!

categories = [
  {
    title: 'Frontend',
    tests: [
      {
        title: 'Java script',
        level: 0,
        questions: [
          {
            body: 'Каким форматом типизации обладает язык',
            answers: [{ body: 'Слабая', is_correct: true }, { body: 'Сильная', is_correct: false }]
          },
          {
            body: 'Кто создатель языка',
            answers: [{ body: 'Гвидо Ван Россум', is_correct: false }, { body: 'Брендан Айк', is_correct: true }]
          },
          {
            body: 'Является ли данное выражение истинным: "0 == false"',
            answers: [{ body: 'Да', is_correct: true }, { body: 'Нет', is_correct: false }]
          }
        ]
      }
    ]
  },
  {
    title: 'Backend',
    tests: [
      {
        title: 'Ruby',
        level: 0,
        questions: [
          {
            body: 'Каким форматом типизации обладает язык',
            answers: [{ body: 'Слабая', is_correct: false }, { body: 'Сильная', is_correct: true }]
          },
          {
            body: 'Кто создатель языка',
            answers: [{ body: 'Юкихиро Мацумото', is_correct: true }, { body: 'Бьёрн Страуструп', is_correct: false }]
          },
          {
            body: 'Является ли данное выражение истинным: "0 == false"',
            answers: [{ body: 'Да', is_correct: false }, { body: 'Нет', is_correct: true }]
          }
        ]
      }
    ]
  }
]


categories.each do |c|
  category = Category.create({ title: c[:title] })

  c[:tests].each do |t|
    test = category.tests.create({ title: t[:title], level: t[:level], author_id: admin.id })

    t[:questions].each do |q|
      question = test.questions.create({ body: q[:body] })

      q[:answers].each do |a|
        question.answers.create({ body: a[:body], is_correct: a[:is_correct] })
      end
    end
  end
end
