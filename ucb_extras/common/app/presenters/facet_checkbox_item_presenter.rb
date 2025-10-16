# frozen_string_literal: true

class FacetCheckboxItemPresenter < Blacklight::FacetCheckboxItemPresenter
  # Check if the query parameters have any inclusive facets with the given value
  # @return [Boolean]
  def selected?
    # search_state.filter(facet_config).values(except: [:missing]).flatten.include?(value)
      search_state.filter(facet_config).values(except: [:filters, :missing]).flatten.include?(value)
  end

  # @private
  def remove_href(path = search_state)
    view_context.search_facet_path(path.filter(facet_config.key).remove(facet_item))
  end

  # @private
  def add_href(path_options = {})
    if facet_config.url_method
      view_context.public_send(facet_config.url_method, facet_config.key, facet_item)
    else
      # search_state.filter(facet_config.key).add(facet_item).to_h.merge(path_options)
      view_context.search_facet_path(id: facet_config.key)
      # view_context.facet_catalog_path(new_state)
      # search_state.add_facet_params_and_redirect(facet_config.key, facet_item).merge(path_options)
    end
  end
end
