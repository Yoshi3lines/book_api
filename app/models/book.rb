class Book < ApplicationRecord
  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, -> (theme) { where("name like ?", "%#{theme}")}

  enum sales_status: {
    reservation: 0, # 予約受付中
    now_on_sales: 1, # 発売中
    end_of_print: 2, # 販売終了
  }

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence: true, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equl_to: 0 }
end
