class ASCII
    def self.art
        File.readlines("app/models/ascii_art.txt") do |line|
            puts line
        end
    end
end