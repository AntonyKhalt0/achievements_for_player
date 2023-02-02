# frozen_string_literal: true

teams = Team.create!([
                       { name: 'ПСЖ' },
                       { name: 'Реал' }
                     ])

players = Player.create!([
                           { first_name: 'Килиаy',
                             last_name: 'Мбаппе',
                             team: teams[0] },
                           { first_name: 'Лионель',
                             last_name: 'Месси',
                             team: teams[0] },
                           { first_name: 'Александр',
                             last_name: 'Летелье',
                             team: teams[0] },
                           { first_name: 'Карим',
                             last_name: 'Бензема',
                             team: teams[1] },
                           { first_name: 'Лука',
                             last_name: 'Модрич',
                             team: teams[1] },
                           { first_name: 'Винисиус',
                             last_name: 'Жуниор',
                             team: teams[1] }
                         ])

matches = Match.create!([
                          {
                            title: "#{teams[0].name} | #{teams[1].name}",
                            second_command_score: 1
                          },
                          {
                            title: "#{teams[1].name} | #{teams[0].name}",
                            second_command_score: 2
                          },
                          {
                            title: "#{teams[0].name} | #{teams[1].name}",
                            first_command_score: 1,
                            second_command_score: 1
                          }
                        ])

teams.each { |team| team.matches = matches }
matches.each { |match| match.teams = teams }

match_results = MatchResult.create!([
                                      {
                                        number_of_passes: 51,
                                        distance_covered: 11_112,
                                        match: matches[0],
                                        player: players[0]
                                      },
                                      {
                                        number_of_passes: 21,
                                        distance_covered: 6532,
                                        match: matches[0],
                                        player: players[1]
                                      },
                                      {
                                        number_of_passes: 34,
                                        distance_covered: 7123,
                                        match: matches[0],
                                        player: players[2]
                                      },
                                      {
                                        number_of_passes: 25,
                                        number_of_goals: 1,
                                        distance_covered: 10_042,
                                        match: matches[0],
                                        player: players[3]
                                      },
                                      {
                                        number_of_passes: 32,
                                        distance_covered: 6213,
                                        match: matches[0],
                                        player: players[4]
                                      },
                                      {
                                        number_of_passes: 44,
                                        distance_covered: 8165,
                                        match: matches[0],
                                        player: players[5]
                                      },
                                      {
                                        number_of_passes: 51,
                                        distance_covered: 7432,
                                        match: matches[1],
                                        player: players[0]
                                      },
                                      {
                                        number_of_passes: 21,
                                        number_of_goals: 2,
                                        distance_covered: 6532,
                                        match: matches[1],
                                        player: players[1]
                                      },
                                      {
                                        number_of_passes: 34,
                                        distance_covered: 7123,
                                        match: matches[1],
                                        player: players[2]
                                      },
                                      {
                                        number_of_passes: 25,
                                        number_of_goals: 1,
                                        distance_covered: 5431,
                                        match: matches[1],
                                        player: players[3]
                                      },
                                      {
                                        number_of_passes: 71,
                                        distance_covered: 10_476,
                                        match: matches[1],
                                        player: players[4]
                                      },
                                      {
                                        number_of_passes: 44,
                                        distance_covered: 8165,
                                        match: matches[1],
                                        player: players[5]
                                      },
                                      {
                                        number_of_passes: 51,
                                        distance_covered: 7432,
                                        match: matches[2],
                                        player: players[0]
                                      },
                                      {
                                        number_of_passes: 21,
                                        distance_covered: 10_043,
                                        match: matches[2],
                                        player: players[1]
                                      },
                                      {
                                        number_of_passes: 34,
                                        number_of_goals: 1,
                                        distance_covered: 7123,
                                        match: matches[2],
                                        player: players[2]
                                      },
                                      {
                                        number_of_passes: 25,
                                        number_of_goals: 1,
                                        distance_covered: 5042,
                                        match: matches[2],
                                        player: players[3]
                                      },
                                      {
                                        number_of_passes: 64,
                                        distance_covered: 11_213,
                                        match: matches[2],
                                        player: players[4]
                                      },
                                      {
                                        number_of_passes: 44,
                                        distance_covered: 8165,
                                        match: matches[2],
                                        player: players[5]
                                      }
                                    ])

achievements = Achievement.create!([
                                     {
                                       title: 'Пробежал более 10000 метров',
                                       rule: 'run_more_10000_meters'
                                     },
                                     {
                                       title: 'Забил не менее 2х голов',
                                       rule: 'scored_at_least_two_goals'
                                     }
                                   ])

6.times { |i| players[i].match_results = MatchResult.where(player: players[i]) }

3.times { |i| matches[i].match_results = MatchResult.where(match: matches[i]) }

match_results.each do |result|
  result.achievements = AchievementsService.new(result).call
end
