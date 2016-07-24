class CategorizedProduct < ActiveRecord::Base
  belongs_to :category
  belongs_to :sock
end
