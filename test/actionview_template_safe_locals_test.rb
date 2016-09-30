require 'test_helper'

# references:
# https://github.com/rails/rails/blob/master/actionview/test/template/compiled_templates_test.rb
class ActionViewTemplateSafeLocalsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ActionViewTemplateSafeLocals::VERSION
  end

  def test_it_renders_the_default
    assert_equal "one\n", render(file: "#{FIXTURE_LOAD_PATH}/test/render_file_with_reserved_words_and_default")
  end

  def test_it_renders_class_symbol
    assert_equal "cool\n", render(file: "#{FIXTURE_LOAD_PATH}/test/render_file_with_reserved_words_and_default", locals: { class: "cool" })
  end

  def test_it_renders_class_string
    assert_equal "cool\n", render(file: "#{FIXTURE_LOAD_PATH}/test/render_file_with_reserved_words_and_default", locals: { "class": "cool" })
  end

  def test_it_renders_a_mixed_case_class_string
    assert_equal "cool\n", render(file: "#{FIXTURE_LOAD_PATH}/test/render_file_with_reserved_words_mixed_case", locals: { "ClAsS": "cool" })
  end


  private
    def render(*args)
      render_with_cache(*args)
    end

    def render_with_cache(*args)
      view_paths = ActionController::Base.view_paths
      ActionView::Base.new(view_paths, {}).render(*args)
    end
end
