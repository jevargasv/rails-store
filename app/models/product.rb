require 'uploads'

class Product < ApplicationRecord
  belongs_to :product_category
  has_many :order_items
  has_one_attached :image

  default_scope { where(active: true) }

  def image_header_variant
    variation =
      ActiveStorage::Variation.new(Uploads.resize_to_limit(width: 500, height: -1, blob: image.blob))
    ActiveStorage::Variant.new(image.blob, variation)
  end

end
