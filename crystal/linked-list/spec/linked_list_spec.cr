require "spec"
require "../src/*"

describe "LinkedList" do
  it "pop gets element from the list" do
    list = LinkedList.new
    list.push(7)
    list.pop.should eq(7)
  end

  it "push/pop respectively add/remove at the end of the list" do
    list = LinkedList.new
    list.push(11)
    list.push(13)
    list.pop.should eq(13)
    list.pop.should eq(11)
  end

  it "shift gets an element from the list" do
    list = LinkedList.new
    list.push(17)
    list.shift.should eq(17)
  end

  it "shift gets first element from the list" do
    list = LinkedList.new
    list.push(23)
    list.push(5)
    list.shift.should eq(23)
    list.shift.should eq(5)
  end

  it "unshift adds element at start of the list" do
    list = LinkedList.new
    list.unshift(23)
    list.unshift(5)
    list.shift.should eq(5)
    list.shift.should eq(23)
  end

  it "pop, push, shift, and unshift can be used in any order" do
    list = LinkedList.new
    list.push(1)
    list.push(2)
    list.pop.should eq(2)
    list.push(3)
    list.shift.should eq(1)
    list.unshift(4)
    list.push(5)
    list.shift.should eq(4)
    list.pop.should eq(5)
    list.shift.should eq(3)
  end

  it "count an empty list" do
    list = LinkedList.new
    list.count.should eq(0)
  end

  it "count a list with items" do
    list = LinkedList.new
    list.push(37)
    list.push(1)
    list.count.should eq(2)
  end

  it "count is correct after mutation" do
    list = LinkedList.new
    list.push(31)
    list.count.should eq(1)
    list.unshift(43)
    list.count.should eq(2)
    list.shift
    list.count.should eq(1)
    list.pop
    list.count.should eq(0)
  end

  it "popping to empty doesn't break the list" do
    list = LinkedList.new
    list.push(41)
    list.push(59)
    list.pop
    list.pop
    list.push(47)
    list.count.should eq(1)
    list.pop.should eq(47)
  end

  it "shifting to empty doesn't break the list" do
    list = LinkedList.new
    list.push(41)
    list.push(59)
    list.shift
    list.shift
    list.push(47)
    list.count.should eq(1)
    list.shift.should eq(47)
  end

  it "deletes the only element" do
    list = LinkedList.new
    list.push(61)
    list.delete(61)
    list.count.should eq(0)
  end

  it "deletes the element with the specified value from the list" do
    list = LinkedList.new
    list.push(71)
    list.push(83)
    list.push(79)
    list.delete(83)
    list.count.should eq(2)
    list.pop.should eq(79)
    list.shift.should eq(71)
  end

  it "deletes the element with the specified value from the list, re-assigns tail" do
    list = LinkedList.new
    list.push(71)
    list.push(83)
    list.push(79)
    list.delete(83)
    list.count.should eq(2)
    list.pop.should eq(79)
    list.pop.should eq(71)
  end

  it "deletes the element with the specified value from the list, re-assigns head" do
    list = LinkedList.new
    list.push(71)
    list.push(83)
    list.push(79)
    list.delete(83)
    list.count.should eq(2)
    list.shift.should eq(71)
    list.shift.should eq(79)
  end

  it "deletes the first of two elements" do
    list = LinkedList.new
    list.push(97)
    list.push(101)
    list.delete(97)
    list.count.should eq(1)
    list.pop.should eq(101)
  end

  it "deletes the second of two elements" do
    list = LinkedList.new
    list.push(97)
    list.push(101)
    list.delete(101)
    list.count.should eq(1)
    list.pop.should eq(97)
  end

  it "delete does not modify the list if the element is not found" do
    list = LinkedList.new
    list.push(89)
    list.delete(103)
    list.count.should eq(1)
  end

  it "deletes only the first occurrence" do
    list = LinkedList.new
    list.push(73)
    list.push(9)
    list.push(9)
    list.push(107)
    list.delete(9)
    list.count.should eq(3)
    list.pop.should eq(107)
    list.pop.should eq(9)
    list.pop.should eq(73)
  end
end
