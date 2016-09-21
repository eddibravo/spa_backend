class Post < ApplicationRecord
  ORDER_AVAILABLE_ATTRS = %w(id created_at updated_at)
  include PgSearch
  belongs_to :user

  pg_search_scope :search_title_like, :against => :title, :using => [:tsearch]

  scope :order_by,  -> ( order_attribute, direction ) do
    order = ORDER_AVAILABLE_ATTRS.include?(order_attribute) ? order_attribute.to_sym : :created_at
    desc = %w(desc asc).include?(direction) ? direction.to_sym : :desc
    order(order => desc)
  end
end
