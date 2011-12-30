module WorkHelper
  def work(work)
    content_tag(:div, class: 'work_wrapper', title: work.name) do
      link_to work.image_url, {title: work.name} do
        image_tag(work.fancybox_url, alt: work.name) +
        work_info(work)
      end
    end
  end

  def work_gallery(collection)
    out = []
    collection.each_slice(elements_per_slice) do |works_slice|
      out << content_tag(:ul) do
        works_slice.collect do |work|
          content_tag(:li, work_thumbnail(work))
        end.join("\n").html_safe
      end
    end
    out.join("\n")
  end

  private
  def work_info(work)
    content_tag(:span, class: :info) do
      content_tag(:span, work.name, class: :title) +
      content_tag(:span, work.description, class: :description)
    end
  end

  def work_thumbnail(work)
    link_to work, {title: work.name} do
      image_tag(work.thumb_url, alt: work.name, size: '95x95')
    end
  end
end
