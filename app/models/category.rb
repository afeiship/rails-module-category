class Category < ApplicationRecord
  # before_save :fill_model

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

  def siblings
    self_and_siblings - [self]
  end

  def self_and_siblings
    parent ? parent.children : self.class.roots
  end

  def descendants
    children.each_with_object(children.to_a) {|child, arr|
      arr.concat child.descendants
    }.uniq
  end

  def self_and_descendants
    [self] + descendants
  end

  def ancestors
    node, nodes = self, []
    nodes << node = node.parent while node.parent
    nodes
  end


  # static methods start:
  def self.roots
    Category.where parent_id: nil
  end
  
  def self.tree_node (node)
    hash = node.attributes;
    if node.children.any?
      hash[:children] = [];
      node.children.each_with_index do |item,index|
        result = item.attributes
        hash[:children] << result
        
        if item.children.any?
          result[:children] = item.children.map do |child|
            self.tree_node child
          end
        end
      end
    end
    return hash
  end

  def self.tree
    roots.map do |root|
      tree_node(root)
    end
  end
  # static methods end:

  private
    def fill_model
      self.parent_id = 0 unless self.parent_id
    end
end
