activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :sprockets

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  set :relative_links, true
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end

# ["papillard", "ssaunier", "monsieurpaillard"].each do |name|
#   proxy "/flats/#{name}.html", "/flats/show.html", locals: { owner: name }, ignore: true
# end

data.users.each do |name|
  proxy "/flats/#{name.github_nickname}.html", "/flats/show.html", locals: { owner: name.github_nickname }, ignore: true
end

# proxy "/flats/papillard.html", "/flats/show.html", locals: { owner: "papillard" }, ignore: true

# whenever the user goes to /flats/papillard.html (in the browser)
# Middleman will use /flats/show.html.erb as a template
# Middleman will create a local variable called owner which is equal to papillard
