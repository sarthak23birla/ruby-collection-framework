# frozen_string_literal: true

class SinglyLinkedListNode
  attr_accessor :val, :next

  def initialize(val, _next)
    @val = val
    @next = _next
  end
end
