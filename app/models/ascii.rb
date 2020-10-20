class ASCII
  def self.art
    File.readlines('app/models/ascii_art.txt') { |line| puts line }
  end
end
