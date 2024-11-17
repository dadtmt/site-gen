require "test_helper"

class PageTest < ActiveSupport::TestCase
  setup do
    @site = sites(:one)
    @page = Page.new(site: @site)
  end

  test "name is mandatory" do
    assert_not @page.save
  end

  test "name is unique per site" do
    @page.name = "Home"

    assert_not @page.save
  end
end
