module Sublist
  enum Classification
    Equal
    Unequal
    Sublist
    Superlist
  end

  def self.classify(list1 : Array(Int32), list2 : Array(Int32)) : Classification
    case
    when list1 == list2
      Classification::Equal
    when (list1.empty? && !list2.empty?) || list2.each_cons(list1.size).any? { |sublist| list1 == sublist }
      Classification::Sublist
    when (list2.empty? && !list1.empty?) || list1.each_cons(list2.size).any? { |sublist| list2 == sublist }
      Classification::Superlist
    else
      Classification::Unequal
    end
  end
end
