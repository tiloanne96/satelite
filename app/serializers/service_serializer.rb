class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :version
end
