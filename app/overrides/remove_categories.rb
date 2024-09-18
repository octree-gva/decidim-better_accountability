Deface::Override.new(
  virtual_path: "decidim/accountability/results/_show_leaf",
  name: "better_accountability_remove_categories_leaf",
  remove: "erb[loud]:contains('cell \"decidim/tags\"')"
)
Deface::Override.new(
  virtual_path: "decidim/accountability/results/_show_parent",
  name: "better_accountability_remove_categories_parent",
  remove: "erb[loud]:contains('cell \"decidim/tags\"')"
)