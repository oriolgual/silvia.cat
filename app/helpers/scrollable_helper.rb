module ScrollableHelper
  def scrollable_seek_to_current_page(collection, current_item)
    if collection && collection.any?
      scrollable_page = collection.index(current_item) / elements_per_slice

      javascript_tag do
        "$(function() { scrollable.seekTo(#{scrollable_page}, 0); });"
      end
    end
  end
end
