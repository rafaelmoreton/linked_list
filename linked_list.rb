# frozen_string_literal: true

# Used to store the head and tail of this single linked list, as well as the
# methods to operate on them and the nodes - instances of the Node class.
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(data)
    if @tail.nil?
      @tail = Node.new(data)
    else
      old_tail = @tail
      @tail = Node.new(data)
      old_tail.next_node = @tail
    end
    @head = @tail if @head.nil?
    p to_s
  end

  def prepend(data)
    if @head.nil?
      @head = Node.new(data)
    else
      old_head = @head
      @head = Node.new(data)
      @head.next_node = old_head
    end
    @tail = @head if @tail.nil?
    p to_s
  end

  def size
    return 0 if @head.nil?

    count = 1
    current_node = @head
    until current_node.next_node.nil?
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
    until current_node.next_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    index = 0
    until current_node.next_node.nil?
      return index if current_node.value == value

      current_node = current_node.next_node
      index += 1
    end
    'nil'
  end

  def to_s
    current_node = @head
    string = ''
    until current_node.nil? && current_node != @head
      string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    "#{string} nil"
  end

  def insert_at(value, position)
    return prepend(value) if position.zero?

    current_node = @head
    index = 0
    until index == position - 1
      current_node = current_node.next_node
      index += 1
    end
    previous_node = current_node
    current_node = Node.new(value)
    current_node.next_node = previous_node.next_node
    previous_node.next_node = current_node
  end

  def remove_at(index)
    current_node = @head
    until index.zero?
      previous_node = current_node
      current_node = current_node.next_node
      index -= 1
    end
    previous_node.next_node = current_node.next_node
    current_node
  end
end

# Each of them is used to store a value (data) on the list and a pointer to the
# next node. The tail node should point to 'nil', terminating the list.
class Node
  attr_accessor :value, :next_node

  def initialize(data)
    @value = data
    @next_node = nil
  end
end

test_list = LinkedList.new
test_list.append(5)
test_list.append(8)
test_list.prepend(10)
test_list.prepend(12)
test_list.append(1)
test_list.append(3)

p "Size #{test_list.size}"
p "Head #{test_list.head.value}"
p "Tail #{test_list.tail.value}"
p "At(2) #{test_list.at(2).value}"
p "Pop tail, 3#{test_list.pop}"
p test_list.to_s
p "Tail #{test_list.tail.value}"
p "Size #{test_list.size}"
p "Contains(8) #{test_list.contains?(8)}"
p "Contains(3) #{test_list.contains?(3)}"
p "Find(8) #{test_list.find(8)}"
p "Find(15) #{test_list.find(15)}"
p "Insert at(3) #{test_list.insert_at(111, 3).value}"
p "Insert at(0) #{test_list.insert_at('head', 0)}"
p test_list.to_s
p "Insert at(5) #{test_list.insert_at(19, 5).value}"
p "Remove at(2) #{test_list.remove_at(2).value}"
p test_list.to_s
