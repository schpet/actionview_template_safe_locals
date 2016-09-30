require "actionview_template_safe_locals/version"
require "action_view"

# https://github.com/rails/rails/blob/master/actionview/lib/action_view/template.rb#L326
module ActionviewTemplateSafeLocals
  RUBY_KEYWORDS = %w(begin end alias and begin break case class def do else
                     elsif end ensure false for if in module next nil not or
                     redo rescue retry return self super then true undef unless
                     until when while yield).to_set

  def locals_code
    locals = @locals.delete_if { |key| RUBY_KEYWORDS.include?(key.downcase) }
    locals.each_with_object("") { |key, code| code << "#{key} = #{key} = local_assigns[:#{key}];" }
  end
end

ActionView::Template.send(:prepend, ActionviewTemplateSafeLocals)
