# frozen_string_literal: true

class FacetFieldCheckboxesComponent < Blacklight::FacetFieldCheckboxesComponent
  def initialize(facet_field:, layout: nil)
    @facet_field = facet_field
    @layout = layout == false ? Blacklight::FacetFieldNoLayoutComponent : FacetFieldComponent
  end

  def render?
    presenters.any?
  end

  def presenters
    return [] unless @facet_field.paginator

    return to_enum(:presenters) unless block_given?

    @facet_field.paginator.items.each do |item|
      yield FacetCheckboxItemPresenter.new(item, @facet_field.facet_field, helpers, @facet_field.key, @facet_field.search_state)
    end
  end
end
