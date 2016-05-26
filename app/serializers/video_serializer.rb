class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :location
  has_many :categories

  def categories
    object.categories.pluck(:id)
  end
end
