require "yaml"
require "nokogiri"

namespace :game_data do
  task update_territories_boundaries: :environment do
    yml_file = "app/game_data/map_areas.yml"
    territories = YAML.load_file(yml_file)
    original = File.read("app/game_data/board.svg")
    svg = Nokogiri::XML.parse(original)
    errors = []

    territories["map_areas"].each_with_index do |territory, index|
      slug = territory["slug"].tr(/_/, "-").gsub("port-of", "port")
      boundaries = svg.at_css("##{slug} boundaries")
      boundaries = svg.at_css("##{slug}") if boundaries.nil?
      if boundaries.nil?
        errors << slug
        next
      end
      territory["id"] = index + 1
      territory["boundaries"] = boundaries["d"]
    end

    ap territories

    puts "Boundaries not found: #{errors.join(', ')}" if errors.present?
    puts "Are you sure you want to save that ? [y/n] (Taca-lhe pau nesse carrinho Marcus ?)"
    input = STDIN.gets.chomp

    if input.casecmp("y").zero?
      puts "Saving territories boundaries..."
      File.open(yml_file, "w") { |f| f.write territories.to_yaml }
      puts "DONE!"
    else
      puts "ABORTED!"
    end
  end
end
