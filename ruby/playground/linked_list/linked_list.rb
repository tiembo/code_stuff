class LinkedList
  def initialize
    @first_node = nil
  end

  def add(item)
    new_node = LinkedListNode.new(item)
    if @first_node.nil?
      @first_node = new_node
    else
      ln = last_node
      ln.next_node = new_node
    end
  end

  def last_node
    return nil if @first_node.nil?
    return @first_node if @first_node.next_node.nil?
    node = @first_node.next_node
    while true do
      break if node.next_node.nil?
      node = node.next_node
    end
    node
  end

  def reverse
    return if @first_node.nil? or @first_node.next_node.nil?
    node = @first_node
    nn = node.next_node
    node.next_node = nil
    while !nn.nil?
      tmp = nn.next_node
      nn.next_node = node
      node = nn
      nn = tmp
    end
    @first_node = node
  end

  def traverse
    ary = []
    node = @first_node
    while !node.nil?
      ary << node.payload
      node = node.next_node
    end
    ary
  end
end

class LinkedListNode
  attr_accessor :next_node
  attr_reader :payload

  def initialize(payload)
    @payload = payload
    @next_node = nil
  end
end

# tests
describe LinkedListNode do
  it "has default next node of nil" do
    n = LinkedListNode.new(1)
    n.payload.should == 1
    n.next_node.should == nil
  end
end

describe LinkedList do
  before (:each) do
    @objects = [1,2,3,4,5]
    @ll = LinkedList.new
    @objects.each {|i| @ll.add(i)}

    @ll_1 = LinkedList.new
    @ll_1.add(1)
  end

  describe "#traverse" do
    it "returns contents of a linked list" do
      @ll.traverse.should == @objects
    end
  end

  describe "#reverse" do
    it "reverses the linked list" do
      @ll.reverse
      @ll.traverse.should == @objects.reverse
    end

    it "does nothing for a linked list with one node" do
      @ll_1.reverse
      @ll_1.traverse.should == [1]
    end
  end

  describe "#last_node" do
    it "returns last node" do
      ln = @ll.last_node
      ln.payload.should == @objects.last
      ln.next_node.should == nil
    end
  end
end

