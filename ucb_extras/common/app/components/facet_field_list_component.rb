# frozen_string_literal: true

class FacetFieldListComponent < Blacklight::FacetFieldListComponent
  def initialize(facet_field:, layout: nil)
    @facet_field = facet_field
    @layout = layout == false ? Blacklight::FacetFieldNoLayoutComponent : FacetFieldComponent
  end
end
