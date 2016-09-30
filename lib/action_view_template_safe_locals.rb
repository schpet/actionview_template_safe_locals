require "action_view_template_safe_locals/version"
require "action_view"

# https://github.com/rails/rails/blob/master/actionview/lib/action_view/template.rb#L326
module ActionViewTemplateSafeLocals
  RESERVED_WORDS = %w(class return super if unless)

  def locals_code
    locals = @locals.delete_if { |key| RESERVED_WORDS.include?(key.downcase) }
    locals.each_with_object("") { |key, code| code << "#{key} = #{key} = local_assigns[:#{key}];" }
  end
end

ActionView::Template.send(:prepend, ActionViewTemplateSafeLocals)
