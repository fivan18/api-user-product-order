class DashboardController < ApplicationController
  before_action :authorize!

  def index # rubocop:disable Metrics/MethodLength
    users = UserSerializer.new(User.order(created_at: :desc).first(5))
    products = ProductSerializer.new(Product.order(created_at: :desc).first(5))
    orders = OrderSerializer.new(Order.order(created_at: :desc).first(5))

    sql = "
        SELECT COUNT(orders.id) AS quantity,
            DATE_PART('month', orders.created_at) AS month,
            DATE_PART('year', orders.created_at) AS year
        FROM orders
        GROUP BY month, year
        ORDER BY month
      "
    orders_per_month = ActiveRecord::Base.connection.execute(sql)

    sql = "
        SELECT SUM(quantities.quantity) AS quantity,
            quantities.product_id AS id,
            products.name as name
        FROM quantities JOIN products ON quantities.product_id = products.id
        GROUP BY quantities.product_id, products.name
        ORDER BY quantity DESC
        LIMIT 5
      "
    most_sale_products = ActiveRecord::Base.connection.execute(sql)

    render json: { users: users, products: products, orders: orders, most_sale_products: most_sale_products,
                   orders_per_month: orders_per_month }
  end
end
