class NameValues
  require 'csv'

  def letters
    ('a'..'z').to_a
  end

  def letter_values
    hash = Hash.new
    letters.each_with_index do |item, index| 
      hash[item] = index + 1 
    end
    hash
  end

  def score_name(name) 
#    require 'pry'; binding.pry
    formatted_name = name.gsub(/\s/, '').downcase.split("")
    formatted_name.reduce(1) { |acc, letter| acc *= letter_values[letter]; acc }
  end 

  def score_list_from_csv(list)
    hash = Hash.new
    names = CSV.foreach(list) do |name|
      hash[name.first] = score_name(name.first)
    end
    hash
  end

  def sort_names_by_score(scored_list)
    scored_list.sort { |name, score| name[1] <=> score[1] }
  end
end

nv = NameValues.new
nv.sort_names_by_score(nv.score_list_from_csv('names.csv'))
