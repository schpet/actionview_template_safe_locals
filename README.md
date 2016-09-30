# ActionViewTemplateSafeLocals

Changes ActionView::Template's render call to let you use ruby keywords as
locals, so that this:

```
<%= render 'my_partial', class: "great" %>
```

Won't raise a syntax error like this:

```
SyntaxError (/Users/schpet/code/rails_template_components_sample/app/views/pages/_my_partial.html.erb:1: syntax error, unexpected '='
...buffer = @output_buffer;class = class = local_assigns[:class...
...                               ^):
  
app/views/pages/_my_partial.html.erb:1: syntax error, unexpected '='
app/views/pages/render_test.html.erb:15:in `_app_views_pages_render_test_html_erb__3359418883750180530_70353544330200'
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'actionview_template_safe_locals'
```

And then execute:

    $ bundle


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

