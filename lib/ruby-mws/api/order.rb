module MWS
  module API

    class Order < Base
      def_request [:list_orders, :list_orders_by_next_token],
        :verb => :get,
        :uri => '/Orders/2011-01-01',
        :version => '2011-01-01',
        :lists => {
          :order_status => "OrderStatus.Status"
        },
        :mods => [
          lambda {|r| r.orders = r.orders.order if r.orders}
        ]

      def_request [:list_order_items, :list_order_items_by_next_token],
        :verb => :get,
        :uri => '/Orders/2011-01-01',
        :version => '2011-01-01',
        :mods => [
          lambda {|r| r.order_items = [r.order_items.order_item].flatten}
        ]

      def_request :get_order,
        :verb => :get,
        :uri => '/Orders/2011-01-01',
        :version => '2011-01-01',
        :lists => {
          :amazon_order_id => "AmazonOrderId.Id"
        },
        :mods => [
          lambda {|r| r.orders = [r.orders.order].flatten}
        ]
        
      def_request :get_matching_product_for_id,
        :verb => :get,
        :uri => '/Products/2011-10-01',
        :version => '2011-10-01',
        :lists => {
          :seller_sku => "IdList.Id"
        },
        :mods => [
          lambda {|r| r.products = r.products.product if r.products}
        ]
    end

  end
end
