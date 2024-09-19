Deface::Override.new(
  virtual_path: "decidim/accountability/results/_home_header",
  name: "better_accountability_mobile_menu_percent",
  insert_bottom: ".intro.section",
  sequence: {before: "better_accountability_surround_home"},
  text: <<~ERB
  <div class="row better_accountability__menu--mobile ">
    <%= render partial: "decidim/better_accountability/menu", locals: {additional_classes: "show-for-small-only"} %>
  </div>
ERB
    
)
