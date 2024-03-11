class LineItem < ApplicationRecord
  after_commit :broadcast_creation_to_clients, on: :create

  def broadcast_creation_to_clients
    # Renderiza un Turbo Stream que agrega el nuevo elemento a la vista
    ActionCable.server.broadcast "items", turbo_stream.append("items_list", partial: "items/item", locals: { item: self })
  end
end
