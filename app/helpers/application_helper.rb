module ApplicationHelper

  # Returns the full title of page (per-page basis)
  def full_title(page_title)
    base_title = "Siphon, Your Videos At Your Finger Tips"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
