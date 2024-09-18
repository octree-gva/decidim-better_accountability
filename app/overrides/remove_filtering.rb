

Deface::Override.new(
  virtual_path: "decidim/accountability/results/_scope_filters",
  name: "better_accountability_remove_scope_filters",
  remove: ".scope-filters.section",
)


Deface::Override.new(
  virtual_path: "decidim/accountability/results/_nav_breadcrumb",
  name: "better_accountability_replace_nav_breadcrum",
  replace: ".lines-breadcrumb",
  text: <<~ERB
  <%= link_to root_path(better_view: better_view_params, **pagination_params), class: "better_accountability__goback" do %>
    <%= icon("chevron-left").html_safe %>
    <span><%= t('navigation.go_back', scope: 'decidim.better_accountability') %></span>
  <% end %>
ERB
)

