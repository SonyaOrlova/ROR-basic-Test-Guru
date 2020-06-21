# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[User, Answer, Question, Test, Category].each(&:destroy_all)

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
    test = Test.create({ title: t[:title], level: t[:level] })

    category.tests << test

    t[:questions].each do |q|
      question = Question.create({ body: q[:body] })

      test.questions << question

      q[:answers].each do |a|
        Answer.create({ body: a[:body], is_correct: a[:is_correct], question_id: question.id })
      end
    end
  end
end

User.create({ name: 'Sonya', email: 'sonya@yandex.ru', password: 'qwerty' })
