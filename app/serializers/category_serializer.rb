class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :videos

  def videos
    object.videos.pluck(:id)
  end
end
