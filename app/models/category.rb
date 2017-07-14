class Category < ApplicationRecord
  before_save :fill_model

  # self join:
  has_many :children, class_name: "Category", foreign_key: :parent_id, inverse_of: :children
  belongs_to :parent, class_name: "Category", foreign_key: :parent_id, inverse_of: :parent, optional: true
  
  private
    def fill_model
      self.parent_id = 0 unless self.parent_id
    end
end
