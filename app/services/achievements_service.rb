# frozen_string_literal: true

class AchievementsService
  AVAILABLE_RULES = %i[
    run_more_10000_meters
    scored_at_least_two_goals
  ].freeze

  def initialize(match_result)
    @match_result = match_result
    @player = @match_result.player
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
    rule = 'run_more_10000_meters'
    achievement = Achievement.find_by(rule: rule)
    return unless @match_result.distance_covered >= 10_000

    increase_achivements_count(rule)
    achievement
  end

  def scored_at_least_two_goals
    rule = 'scored_at_least_two_goals'
    achievement = Achievement.find_by(rule: rule)
    return unless @match_result.number_of_goals >= 2

    increase_achivements_count(rule)
    achievement
  end

  def increase_achivements_count(rule)
    @player.achievements_score[rule] += 1
    @player.save
  end
end
