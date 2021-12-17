class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def append(data)
    unless @tail.nil?
      old_tail = @tail 
      @tail = Node.new(data)
      old_tail.next_node = @tail
    else
      @tail = Node.new(data)
    end
    @head = @tail if @head.nil?
    p to_s
  end

  def prepend(data)
    unless @head.nil?
      old_head = @head
      @head = Node.new(data)
      @head.next_node = old_head
    else
      @head = Node.new(data)
    end
    @tail = @head if @tail.nil?
    p to_s
  end

  def size
    return 0 if @head == nil

    count = 1
    current_node = @head
    until current_node.next_node == nil
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def at(index)
    current_node = @head
    until index <= 0
      current_node = current_node.next_node
      index -= 1
    end
    current_node
  end

  def pop
    @tail = at(size - 2)
    @tail.next_node = nil
  end

  def contains?(value)
    current_node = @head
    until current_node.next_node == nil
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    index = 0
    until current_node.next_node == nil
      return index if current_node.value == value
      current_node = current_node.next_node
      index += 1
    end
    nil
  end

  def to_s
    current_node = @head
    string = ""
    loop do
      string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    string += "nil"
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(data)
    @value = data
    @next_node = nil
  end
end

aparatos = LinkedList.new
aparatos.append(5)
aparatos.append(8)
aparatos.prepend(10)
aparatos.prepend(12)
aparatos.append(1)
aparatos.append(3)


# p "Size #{aparatos.size}"
# p "Head #{aparatos.head.value}"
# p "Tail #{aparatos.tail.value}"
# p "At(2) should be 5. It is: #{aparatos.at(2).value}"
# p "Pop tail, 3#{aparatos.pop}, new tail should be 1: #{aparatos.tail.value}; Size 5: #{aparatos.size}"

# p "Contains(8) should return true: #{aparatos.contains?(8)}, Contains(3), which return false: #{aparatos.contains?(3)}"
# p "Find(8) should return index 3: #{aparatos.find(8)}"
