# frozen_string_literal: true

require_relative 'node'

class DoublyLinkedList
  attr_accessor :head, :last, :length

  def initialize
    @head = nil
    @last = nil
    @length = 0
  end

  # @param [Integer] (index) Index whose value you want to retrieve.
  # @return [Integer] (Return) the value of the node.
  def get(index)
    return -1 if index >= @length

    current_index = 0
    pointer = @head
    while current_index != index
      pointer = pointer.next
      current_index += 1
    end
    pointer&.val
  end

  # @param [Object] val
  # @return [nil]
  def add_at_head(val)
    new_node = DoublyLinkedListNode.new(val, @head, nil)
    if @length.zero?
      @head = new_node
      @last = new_node
    else
      @head.prev = new_node
      @head = new_node
    end
    @length += 1
    nil
  end

  # @param [Object] val
  # @return [nil]
  def add_at_tail(val)
    new_node = DoublyLinkedListNode.new(val, nil, @last)
    if @length.zero?
      @head = new_node
    else
      @last.next = new_node
    end
    @last = new_node
    @length += 1
    nil
  end

  # @param [Integer] index where value need to be inserted
  # @param [Object] value which needs to be inserted
  # @return [nil] nil
  def add_at_index(index, val)
    return if index > length

    case index
    when length
      add_at_tail(val)
    when 0
      add_at_head(val)
    else
      current_index = 0
      current_pointer = @head
      prev_pointer = nil
      while current_index != index
        current_pointer = current_pointer.next
        prev_pointer = current_pointer.prev
        current_index += 1
      end
      new_node = DoublyLinkedListNode.new(val, current_pointer, prev_pointer)
      current_pointer.prev = new_node
      prev_pointer.next = new_node
      @length += 1
    end
  end

  # @param [Integer] (index) Index where value need to be inserted
  # @return [nil] nil
  def delete_at_index(index)
    return if index >= @length

    case index
    when 0
      @head = @head.next
      @head&.prev = nil
    when @length - 1
      @last = @last.prev
      @last.next = nil
    else
      current_index = 0
      current_pointer = @head
      prev_pointer = nil
      while current_index != index
        current_pointer = current_pointer.next
        prev_pointer = current_pointer.prev
        current_index += 1
      end
      prev_pointer.next = current_pointer.next
      current_pointer.next.prev = prev_pointer
    end
    @length -= 1
  end

  # @return [String] Return the Linked List with all the values Concatenated with '->'
  def to_s
    current_pointer = @head
    str = ''
    until current_pointer.nil?
      str += current_pointer.val.to_s
      current_pointer = current_pointer.next
      str += '->' unless current_pointer.nil?
    end
    str
  end
end
