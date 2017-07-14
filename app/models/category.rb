class Category < ApplicationRecord
  before_save :fill_model

  # self join:
  has_many :children, class_name: "Category", inverse_of: :parent, foreign_key: :parent_id
  belongs_to :parent, class_name: "Category", inverse_of: :children, foreign_key: :parent_id, optional: true
  
  def depth
    ancestors.size
  end

  def root
    node = self
    node = node.parent while node.parent
    node
  end

  # Returns all siblings of the current node.
  #
  #   subchild1.siblings # => [subchild2]
  def siblings
    self_and_siblings - [self]
  end

  # Returns all siblings and a reference to the current node.
  #
  #   subchild1.self_and_siblings # => [subchild1, subchild2]
  def self_and_siblings
    parent ? parent.children : self.class.roots
  end

  def ancestors
    node, nodes = self, []
    nodes << node = node.parent while node.parent
    nodes
  end

  private
    def fill_model
      self.parent_id = 0 unless self.parent_id
    end
end
