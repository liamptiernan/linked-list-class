class LinkedList
    attr_accessor :list

    def initialize(list=[])
        @list = list
    end

    def test()
        p self.tail()
    end

    def append(new_node)
        tail_node = self.tail()

        tail_node.set_next_node(new_node)
        new_node.set_next_node(nil)
        @list << new_node
    end

    def prepend(new_node)
        new_node.set_next_node(self.head())
        @list << new_node
    end

    def size()
        return @list.length
    end

    def head()
        next_nodes = []

        @list.each do |node|
            next_nodes << node.next_node
        end

        @list.each_with_index do |node,index|
            unless next_nodes.include?(node)
                return node
            end
        end
    end

    def tail()
        @list.each do |node|
            if node.next_node == nil
                return node
            end
        end
    end

    def at(index)
        node = self.head()

        index.times do
           node = node.next_node unless node == nil
        end

        return node
    end

    def pop()
        next_nodes = {}
        @list.each_with_index do |node, index|
            next_nodes[node.next_node] = index
        end

        last_node = @list[next_nodes[nil]]
        @list[next_nodes[last_node]].set_next_node(nil)

        @list.slice!(next_nodes[nil])
    end

    def contains?(value)
        @list.each do |node|
            if node.value == value
                return true
            end
        end
        return false
    end

    def find(value)
        node = self.head()
        i = 0
        @list.length.times do
            if node.value == value
                return i
            else
                node = node.next_node
                i += 1
            end
        end
        return nil
    end

    def to_s()
        node_values = []

        node = self.head()

        @list.length.times do
            node_values << node.value()
            node = node.next_node()
        end

        node_values << 'nil'

        node_values.join(' -> ')
    end

    def insert_at(new_node, index)
        if index < 0 || index > self.size-1
            return -1
        elsif index == self.size-1
            self.append(new_node)
        elsif index == 0
            self.prepend(new_node)
        else
            new_node.set_next_node(self.at(index))
            self.at(index-1).set_next_node(new_node)

            @list << new_node
        end
    end

    def remove_at(index)
        if index < 0 || index > self.size-1
            return -1
        elsif index == self.size-1
            self.pop()
        elsif index == 0
            node = self.at(index)

            @list.slice!(@list.index(node))
        else
            node = self.at(index)
            leading_node = self.at(index-1)
            trailing_node = self.at(index+1)
            
            leading_node.set_next_node(trailing_node)

           @list.slice!(@list.index(node))
        end
    end
end

class Node
    def initialize(value=nil,next_node=nil)
        @value = value
        @next_node = next_node
    end

    def value()
        return @value
    end

    def next_node()
        return @next_node
    end

    def set_value(value)
        @value = value
    end

    def set_next_node(node)
        @next_node = node
    end
end


node_one = Node.new(1)
node_two = Node.new(2)
node_three = Node.new(3)
node_four = Node.new(4)
node_five = Node.new(5)

node_one.set_next_node(node_two)
node_two.set_next_node(node_three)
node_three.set_next_node(node_five)
node_four.set_next_node(nil)
node_five.set_next_node(node_four)

node_ten = Node.new(10)
node_twenty = Node.new(20)
list = LinkedList.new([node_one,node_two,node_three,node_four,node_five])

# p list.to_s()

# p list.find(4)

# p list.contains?(5)
# p list.to_s()
# list.pop() 
# p list.to_s()

# p list.at(3)

# p list.head().value()

# p list.size()

# list.prepend(node_twenty)

# list.append(node_ten)

# p list.head().value()

# p list.to_s()

# node_101 = Node.new(101)
# p list.to_s()
# p list.to_s()
# list.insert_at(node_101,4)

# p list.to_s()

# list.remove_at(4)
# p list.to_s