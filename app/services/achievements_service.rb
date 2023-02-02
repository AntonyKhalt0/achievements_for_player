class AchievementsService
  AVAILABLE_RULES = [
    :run_more_10000_meters,
    :scored_at_least_two_goals
  ]

  def initialize(match_result)
    @match_result = match_result
  end

  def call
    achievements = []
    AVAILABLE_RULES.each { |rule| achievements.push(awarding(rule)) }
    achievements.compact
  end

  private

  def awarding(rule)
    send(rule)
  end

  def run_more_10000_meters
    achievement = Achievement.find_by(rule: 'run_more_10000_meters')
    achievement if @match_result.distance_covered >= 10000
  end

  def scored_at_least_two_goals
    achievement = Achievement.find_by(rule: 'run_more_10000_meters')
    achievement if @match_result.number_of_goals >= 2
  end
end
