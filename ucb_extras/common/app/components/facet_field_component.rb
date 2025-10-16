# frozen_string_literal: true

class FacetFieldComponent < Blacklight::FacetFieldComponent

  # @param [Blacklight::FacetFieldPresenter] facet_field
  def initialize(facet_field:, in_advanced_search: false)
    @facet_field = facet_field
    @in_advanced_search = in_advanced_search
  end

  def in_advanced_search?
    @in_advanced_search
  end
end
