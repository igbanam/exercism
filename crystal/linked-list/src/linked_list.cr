class LinkedList
  # Write your code for the 'Linked List' exercise in this file.
  property store = Array(Int32).new

  def push(n : Int32)
    store << n
  end

  def pop
    store.pop
  end

  def shift
    store.shift
  end

  def unshift(n : Int32)
    store.unshift(n)
  end

  def count
    store.size
  end

  def delete(n : Int32)
    return if index(n).nil?
    store.delete_at(index(n).not_nil!)
  end

  private def index(n : Int32)
    store.index { |m| n == m }
  end
end
