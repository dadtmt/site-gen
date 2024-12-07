require "test_helper"

class SitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site = sites(:one)
  end

  # test "should get index" do
  #   get sites_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_site_url
  #   assert_response :success
  # end

  # test "should create site" do
  #   assert_difference("Site.count") do
  #     post sites_url, params: { site: { title: "a new site" } }
  #   end

  #   assert_redirected_to site_url(Site.last)
  # end

  test "should show site" do
    # queries only sites, pages, contents, attachments, blobs, variants once
    assert_queries_count(6) { get site_url(@site) }
    # get site_url(@site)

    assert_response :success

    assert_select "nav"
    assert_select "nav ul li a", 2
    assert_select "a[href='#home']"
    assert_select "section", 2

    # home page
    assert_select "h1", "Professional Makeup Artist"
    assert_select "p", "Transform your look with our expert beauty services"
    assert_select "img[src*='logo.webp']"

    # gallery page
    assert_select "h2", "Gallery"
    assert_select "div.container"
    assert_select "div.container" do
      assert_select "img[src*='1.jpg']"
    end
  end

  # test "should get edit" do
  #   get edit_site_url(@site)
  #   assert_response :success
  # end

  # test "should update site" do
  #   patch site_url(@site), params: { site: { title: @site.title } }
  #   assert_redirected_to site_url(@site)
  # end

  # test "should destroy site" do
  #   assert_difference("Site.count", -1) do
  #     delete site_url(@site)
  #   end

  #   assert_redirected_to sites_url
  # end
end
