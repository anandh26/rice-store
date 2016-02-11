module ApplicationHelper

  def category
    Category.all
  end

  def slide_content
    SlideContent.all
  end

  def rice_all
    Product.all.where(category_id: 1, status: 't')
  end
  def cereal_all
    Product.all.where(category_id: 2, status: 't')
  end

  def format_category_title(title)
    title.gsub(' ', '-').downcase
  end

  def quantity
    [
        ['1 Kg','1'],
        ['2 Kg','2'],
        ['3 Kg','3'],
        ['4 Kg','4'],
        ['5 Kg','5'],
        ['10 Kg','6'],
        ['15 Kg','7'],
        ['25 Kg','8']
    ]
  end

  def country
    [
        ['India','IN']
    ]
  end

  def total_products_price(products)
    sum = 0
    products.each do |prod|
      sum += prod.price.to_i * prod.quantity
    end
    sum
  end

  def price_with_quantity(price, quantity)
    price.to_i * quantity.to_i
  end

end
