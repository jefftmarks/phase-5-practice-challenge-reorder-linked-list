require_relative './node'
require 'pry'

class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

	def append(node)
		if self.head.nil?
			self.head = node
			return
		end

		last_node = self.head
		while last_node.next_node
			last_node = last_node.next_node
		end
		last_node.next_node = node
	end

  def reorder_linked_list
		return if self.head.nil?

    odd = LinkedList.new
		even = LinkedList.new

		last_odd = nil

		count = 1
		
		while self.head do
			node = self.head
			self.head = node.next_node
			node.next_node = nil

			if count % 2 == 0
				even.append(node)
			else
				if node.next_node.nil? || node.next_node.next_node.nil?
					last_odd = node
				end
				odd.append(node)
			end

			count += 1
		end

		last_odd.next_node = even.head
		self.head = odd.head
  end

end

head = Node.new(1, Node.new(2))
linked_list = LinkedList.new(head)

linked_list.reorder_linked_list

# binding.pry
