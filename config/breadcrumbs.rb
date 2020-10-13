crumb :root do
  link "トップページ", root_path
end

crumb :items do |item|
  link "商品詳細ページ", item_path(item)
  parent :root,item
end

crumb :items_edit do |item|
  link "商品編集ページ", edit_item_path(item)
  parent :items,item
end

crumb :purchases_index do |item|
  link "商品購入ページ",  item_purchases_path(item)
  parent :items,item
end

crumb :items_new do
  link "商品出品ページ", new_item_path
  parent :root
end

crumb :items_search do
  link "検索結果ページ", search_items_path
  parent :root
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).