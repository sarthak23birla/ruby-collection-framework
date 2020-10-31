# frozen_string_literal: true

class DoublyLinkedListNode
  attr_accessor :val, :next, :prev

  def initialize(val, _next, _prev)
    @val = val
    @next = _next
    @prev = _prev
  end
end
