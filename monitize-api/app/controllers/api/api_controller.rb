class Api::ApiController < ApplicationController
  respond_to :json

  protected

  def serialize_resource(resource, serializer, scope=nil)
    JSON.parse(serializer.new(resource, scope: scope ).to_json)
  end

  def serialize_resource_list(resources, serializer)
    response = JSON.parse(ActiveModelSerializers::SerializableResource.new(resources, each_serializer: serializer, include: "**").to_json)
    response
  end

  def serialize_fixed_values(values)
    values
  end

  def paginate(scope, serializer, default_per_page = 20)
    collection = scope.page(params[:page]).per((params[:per_page] || default_per_page).to_i)

    current, total, per_page = collection.current_page, collection.total_pages, collection.limit_value

    return {
      data: serialize_resource_list(collection, serializer),
      pagination: {
        current:  current,
        previous: (current > 1 ? (current - 1) : nil),
        next:     (current == total ? nil : (current + 1)),
        per_page: per_page,
        pages:    total,
        count:    collection.total_count
      }
    }
  end
end
