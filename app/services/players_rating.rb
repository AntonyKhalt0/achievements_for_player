# frozen_string_literal: true

class PlayersRating
  def overall_top_players(rule)
    return Player.order(first_achive_count: :desc).limit(5) if rule == 'run_more_10000_meters'

    Player.order(second_achive_count: :desc).limit(5) if rule == 'scored_at_least_two_goals'
  end

  def team_top_players(rule, team_name)
    if rule == 'run_more_10000_meters'
      return Player.joins(:team).where(team: { name: team_name }).order(first_achive_count: :desc).limit(5)
    end

    return unless rule == 'scored_at_least_two_goals'

    Player.joins(:team).where(team: { name: team_name }).order(second_achive_count: :desc).limit(5)
  end
end
