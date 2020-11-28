require 'spec_helper'

RSpec.describe DoublyLinkedList do
  it 'initialize the DoublyLinked List' do
    linked_list = DoublyLinkedList.new
    expect(linked_list.to_s).to eq('')
  end

  it 'on adding add head after inserting from tail' do
    linked_list = DoublyLinkedList.new
    linked_list.add_at_tail(2)
    linked_list.add_at_head(1)
    expect(linked_list.to_s).to eq('1->2')
  end
end