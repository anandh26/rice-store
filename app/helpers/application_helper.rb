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
end
