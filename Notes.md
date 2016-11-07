1. In recipes - search.html.erb
I currently have photos rendering correctly after the @search_results.each do loop.
```
<%=link_to image_tag(search.photo), {action: 'show', controller: 'recipes'} %>
```
I'm thinking about changing it to be this:
```
<%= link_to image_tag(search.photo), show_recipes_path(recipe.id) %>
```


<%@search_results.each do |search| %>
  <%=image_submit_tag(search.photo) %>
  <!-- hidden_field_tag(name, options={}) -->
  <%=hidden_field_tag(search.name)%>
  <%=hidden_field_tag(search.ingredientLines)%>
  <%=hidden_field_tag(search.url)%>
<% end %>


<%= form_tag (show_recipes_path, method: :post) %>
<%=hidden_field_tag %>


    if url == nil || name == nil || photo == nil || uri = nil || ingredientLines == nil || url == ""  || name == "" || photo == "" || uri = "" || ingredientLines == "" || link == nil || link == "" || r_source == nil || r_source == "" || diet_labels == nil || diet_labels == "" || health_labels == nil || health_labels == ""
