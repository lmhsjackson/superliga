module LeaguesHelper
  def self.full_name(league)
    "#{league.edition}° #{league.name}"
  end
end
