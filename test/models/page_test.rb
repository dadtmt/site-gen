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

  test "anchor is derived from name" do
    @page.name = "New page"
    @page.save

    assert_equal "new-page", @page.anchor
  end

  test "anchor is unique per site" do
    @page.name = "New page"
    @page.save

    assert_not @page.update(anchor: "home")
  end
end
