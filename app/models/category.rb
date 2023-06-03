class Category < ApplicationRecord
    belongs_to :user
    has_many :spend_items, dependent: :destroy
    has_many :spendings, through: :spend_items
  
    validates :name, presence: true
    validates :icon, presence: true
    def total_amount
      total = 0
      spendings.each do |spending|
        total += spending.amount
      end
      total
    end
  end
  