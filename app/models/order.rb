class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  enum status: [ :received, :waiting_payment, :in_production, :delivered ]
  enum origin_device: [:unknown, :ios, :android, :web]

  def add_item(product, value)
    self.order_items << OrderItem.create(product: product, value: value)
  end

  def user_name
    read_attribute('user_name') || user.name
  end

  def product_names
    # uniq_products = self.products.uniq

    # uniq_products = Product.find_by_sql(["select distinct products.name from products
    #   inner join order_items on order_items.product_id = products.id
    #   inner join orders on orders.id = order_items.order_id
    #   where orders.id = ?", self.id])

    # uniq_products = Product.select(:name).distinct.joins(order_items: :order).where(order_items: {order: self})

    uniq_products = Product.select(:name).distinct.joins(:orders).where(orders: {id: self.id})

    uniq_products.map(&:name).join(', ')
  end

  def total
    # self.order_items.sum(&:value)

    # OrderItem.select("sum(order_items.value) as sum_value").where(order: self).take.sum_value

    OrderItem.where(order: self).sum(:value)
  end

  def avg_value
    # self.total / self.order_items.size

    # OrderItem.select("avg(order_items.value) as avg_value").where(order: self).take.avg_value

    OrderItem.where(order: self).average(:value)
  end

end
