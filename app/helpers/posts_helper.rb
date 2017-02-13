module PostsHelper
  def link_to_pics(pics)
    pics.map { |url| link_to 'image', url }.join(",").html_safe
  end

end
