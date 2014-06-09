module Hub
	class Shipment
	  include Mongoid::Document
	  #include Mongoid::Attributes::Dynamic
	  include Mongoid::Timestamps

	  belongs_to :cart, class_name: 'Hub::Cart'

	  field :_id, type: String
	  field :order_id, type: String
	  field :email, type: String
	  field :cost, type: Float
	  field :status, type: String
	  field :stock_location, type: String
    field :shipping_method, type: String
	  field :tracking, type: String
	  field :updated_at, type: Date
	  field :shipped_at, type: Date

    has_many :items, class_name: 'Hub::LineItem'
    belongs_to :shipping_address, class_name: 'Hub::Address'

    accepts_nested_attributes_for :items
   # accepts_nested_attributes_for :options

    validates_presence_of :order_id, :status, :email, :cost, 
      :stock_location, :shipping_address, :shipping_method 

	end
end