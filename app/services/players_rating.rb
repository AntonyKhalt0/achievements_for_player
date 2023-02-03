# frozen_string_literal: true

class PlayersRating
  def overall_top_players(rule)
    Player.order(Arel.sql("achievements_score->>'#{rule}' DESC")).limit(5)
  end

  def team_top_players(rule, team_name)
    Player.joins(:team).where(team: { name: team_name.to_s }).order(Arel.sql("achievements_score->>'#{rule}' DESC")).limit(5)
  end
end
