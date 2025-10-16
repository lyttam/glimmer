# frozen_string_literal: true

class FacetFieldPresenter < Blacklight::FacetFieldPresenter

  def initialize(
      facet_field,
      display_facet,
      view_context,
      search_state = view_context.search_state
  )
    @facet_field = facet_field
    @display_facet = display_facet
    @view_context = view_context
    @search_state = search_state
  end

  def active?
    if in_advanced_search?
      search_state.filter(facet_field).values(except: [:filters, :missing]).any?
      # search_state.filter(facet_field).values(except: [:missing]).any?
    else
      search_state.filter(facet_field).any?
    end
  end

  def in_advanced_search?
    search_state.params[:action] == "advanced_search"
  end

  def modal_path
    return unless paginator

    view_context.search_facet_path(id: key) unless paginator&.last_page?
  end
end
