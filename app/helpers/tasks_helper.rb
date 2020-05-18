# frozen_string_literal: true

module TasksHelper
  def tag_name(tag_list)
    tag_list.tag.name
  end

  def tags_collection(condition)
    Tag.order(condition)
  end
end
