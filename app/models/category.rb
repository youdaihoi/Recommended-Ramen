# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :ramen, dependent: :destroy
end
