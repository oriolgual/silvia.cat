module WorkHelper
  def work(work)
    link_to work.image_url, {title: work.name} do
      image_tag(work.fancybox_url, alt: work.name) +
      work_info(work)
    end
  end

  private
  def work_info(work)
    content_tag(:span, class: :info) do
      content_tag(:span, work.name, class: :title) +
      content_tag(:span, work.description, class: :description)
    end
  end
end
