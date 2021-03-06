# frozen_string_literal: true

class KidSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :image_url, :books
end
