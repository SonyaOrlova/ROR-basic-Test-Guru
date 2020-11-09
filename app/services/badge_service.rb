class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def getBadges()
    return if !@test_passage.passed || @test_passage.badges.present?

    user = @test_passage.user

    @passed_test = @test_passage.test
    @passed_tests = user.passed_tests.where(test_passages: { passed: true })

    badges = Badge.all.map do |badge|
      if send(badge.rule_type, badge.rule_value)
        badge.test_passage = @test_passage

        badge
      end
    end.compact

    user.badges.push(badges)
  end

  private

  def all_in_category(category)
    return if category != @passed_test.category.title
    return if already_passed?(@passed_test)

    @passed_tests.joins(:category).where(categories: { title: category }).select(:title, :level).distinct.size == Test.joins(:category).where(categories: { title: category }).size
  end

  def all_in_level(level)
    return if level.to_i != @passed_test.level
    return if already_passed?(@passed_test)

    @passed_tests.where(level: level).select(:title, :category_id).distinct.size == Test.where(level: level).size
  end

  def number_of_tries(count)
    tries_count = @passed_tests.where(title: @passed_test.title, level: @passed_test.level, category_id: @passed_test.category_id).size

    count.to_i == tries_count
  end

  def already_passed?(test)
    @passed_tests.where(title: test.title, level: test.level, category_id: test.category_id).size > 1
  end
end
