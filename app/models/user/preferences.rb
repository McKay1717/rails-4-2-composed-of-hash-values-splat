require 'set'

class User::Preferences
  AVAILABLE_PREFERENCES = %w(
    newsletters
    recommendations
  ).to_set.freeze

  HUMAN_PREFERENCES = {
    "newsletters" => "Newsletter and Special Offers",
    "recommendations" => "Recommendations"
  }.freeze

  def self.humanize(key)
    HUMAN_PREFERENCES[key]
  end

  def initialize(preferences)
    @preferences = preferences || {}
    @preferences = sanitize_preferences
    @preferences = default_preferences.merge(@preferences)
  end

  def to_hash
    @preferences
  end

  def merge(other)
    self.class.new(@preferences.merge(other))
  end

  private

  def sanitize_preferences
    # remove any preference that we did not define in AVAILABLE_PREFERENCES
    @preferences.reject { |key, value| !AVAILABLE_PREFERENCES.include?(key) }
  end

  def default_preferences
    Hash[AVAILABLE_PREFERENCES.map { |preference| [preference, true] }]
  end
end
