# frozen_string_literal: true

# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  stars      :integer          default("0"), not null
#  price      :integer          default("1"), not null
#  category   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ApplicationRecord

	has_many :restaurant_menus, inverse_of: :restaurant, dependent: :destroy
	accepts_nested_attributes_for :restaurant_menus, reject_if: :all_blank, allow_destroy: true

  scope :search, ->(query) {
    query = sanitize_sql_like(query)
    where(arel_table[:name].matches("%#{query}%"))
      .or(where(arel_table[:category].matches("%#{query}%")))
  }
end
