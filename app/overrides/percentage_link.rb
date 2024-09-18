Deface::Override.new(
  virtual_path: "decidim/accountability/results/_search",
  name: "better_accountability_replace_search",
  insert_after: "erb[loud]:contains('form_tag results_path')",
  text: <<~ERB
  <input type="hidden" name="better_view" value="percentage" />
ERB
)

Deface::Override.new(
  virtual_path: "decidim/accountability/results/_results_parent",
  name: "better_accountability_replace_result_parents_link",
  replace: "erb[loud]:contains('link_to result')",
  closing_selector: "erb[silent]:contains('end')",
  text: <<~ERB
<%= link_to result_path(result, better_view: :percentage), class: "card--list__text card__link card__link--block deface-override" do %>
    <h3 class="card--list__heading">
        <%= translated_attribute result.title %>
    </h3>

    <span class="text-small"><%= heading_leaf_level_results(result.children.count) %></span><% end %>
ERB
)

Deface::Override.new(
    virtual_path: "decidim/accountability/results/_results_leaf",
    name: "better_accountability_replace_results_leaf",
    insert_after: "erb[loud]:contains('link_to result_path(result)')",
    text: <<~ERB
<%= link_to result_path(result, **pagination_params, better_view: better_view_params), class: "card--list__text card__link card__link--block deface-override" do %>
    <h4 class="card--list__heading">
        <%= translated_attribute(result.title) %>
    </h4>

    <div class="text-small card--meta">
        <% if result.start_date %>
        <strong><%= t("models.result.fields.start_date", scope: "decidim.accountability") %></strong>
        <span><%= l result.start_date, format: :decidim_short %></span>
        <% end %>

        <% if result.end_date %>
        <strong><%= t("models.result.fields.end_date", scope: "decidim.accountability") %></strong>
        <span><%= l result.end_date, format: :decidim_short %></span>
        <% end %>

        <% if result.status %>
        <strong><%= t("models.result.fields.status", scope: "decidim.accountability") %></strong>
        <span><%= translated_attribute(result.status.name) %></span>
        <% end %>
    </div>
<% end %>
ERB
  )

Deface::Override.new(
  virtual_path: "decidim/accountability/results/_home_categories",
  name: "better_accountability_replace_cat_percentage",
  replace: "erb[loud]:contains('link_to translated_attribute(category.name)')",
  text: <<~ERB
  <%= link_to translated_attribute(category.name),results_path(better_view: :percentage, filter: { with_category: category, with_scope: current_scope }), class: "deface-override" %>
ERB
)
Deface::Override.new(
  virtual_path: "decidim/accountability/results/_home_categories",
  name: "better_accountability_replace_sub_result_percentage",
  replace: "erb[loud]:contains('link_to results_path')",
  closing_selector: "erb[silent]:contains('end')",
  text: <<~ERB
  <%= link_to results_path(better_view: :percentage, filter: { with_category: subcategory, with_scope: current_scope }), class: "medium-4 columns end card__link card__link--block deface-override" do %>
    <div class="category--line">
        <strong><%= translated_attribute(subcategory.name) %></strong>

        <% if component_settings.display_progress_enabled? && progress_calculator(current_scope, subcategory.id).present? %>
            <div class="progress-figure heading3">
            <%= display_percentage progress_calculator(current_scope, subcategory.id) %>
            </div>
        <% end %>

        <div class="category--count">
            <%= display_count subcategory_results_count %>
        </div>
    </div>
<% end %>
ERB
)
