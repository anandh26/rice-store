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

  def find_category_name(sub_category)
    p sub_category
    p 'sub_categorysub_category'
    result = SubCategory.find_by(id: sub_category)
    p result.category.name
    result.category.name
  end
end
