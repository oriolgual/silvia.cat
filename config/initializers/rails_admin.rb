RailsAdmin.config do |config|
  config.excluded_models << "User"
  # config.model Illustration do
  #   list do
  #     field :name
  #     field :created_at
  #     field :updated_at
  #     filters [:name, :description, :created_at, :updated_at]
  #     field :created_at do
  #       searchable false
  #     end
  #     field :updated_at do
  #       searchable false
  #     end
  #     field :image      do
  #       searchable false
  #     end
  #     field :tags       do
  #       searchable false
  #     end
  #   end
  #   create do
  #     field :name
  #     field :description
  #     field :image
  #     field :tags
  #   end
  # end
end
