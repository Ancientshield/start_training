# frozen_string_literal: true

module TasksHelper
  def tag_name(t)
    Tag.find(t.tag_id).name
  end

  def tags_collection(n)
    Tag.order(n)
  end
end
