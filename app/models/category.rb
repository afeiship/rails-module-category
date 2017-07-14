class Category < ApplicationRecord
  before_save :fill_model

  # self join:
  has_many :children, class_name: "Category", inverse_of: :parent, foreign_key: :parent_id
  belongs_to :parent, class_name: "Category", inverse_of: :children, foreign_key: :parent_id, optional: true
  
  private
    def fill_model
      self.parent_id = 0 unless self.parent_id
    end
end
