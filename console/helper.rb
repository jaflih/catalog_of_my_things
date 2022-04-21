def add_author(authors, item)
  return if authors.empty?

  puts 'Select the author '
  authors.each_with_index do |author, index|
    puts "#{index}) FirstName: #{author.first_name}, LastName: #{author.last_name}"
  end
  author_id = gets.chomp.to_i
  authors[author_id].add_item(item)
end

def add_genres(genres, item)
  return if genres.empty?

  puts 'Select the genre '
  genres.each_with_index { |genre, index| puts "#{index}) Name #{genre.name}" }
  genres_id = gets.chomp.to_i
  genres[genres_id].add_item(item)
end

def add_label(labels, item)
  return if labels.empty?

  puts 'Select the label '
  labels.each_with_index { |label, index| puts "#{index}) Title #{label.title}" }
  label_id = gets.chomp.to_i
  labels[label_id].add_item(item)
end

def seach_author(authors, key)
  authors.select { |p| p.first_name == key } [0]
end

def seach_label(labels, key)
  labels.select { |p| p.title == key } [0]
end

def seach_genre(genres, key)
  genres.select { |p| p.name == key } [0]
end
