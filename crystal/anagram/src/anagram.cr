class String
  def sorter
    self.downcase.chars.sort.join
  end
end

module Anagram
  def self.find(subject : String, candidates : Array(String)) : Array(String)
    candidates.select { |f| f.downcase != subject.downcase && f.sorter == subject.sorter }
  end
end
