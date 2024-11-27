require "test_helper"

class PicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gallery = pages(:gallery)
    @pic  = contents(:pic1)
  end

  test "should get pics index" do
    # queries only pages, contents, attachments, blobs once
    assert_queries_count(4) { get gallery_pics_url(@gallery) }

    assert_response :success

    assert_select "figure", 2
    assert_select "img[src*='pic']", 2
  end

  test "should show one pic" do
    # queries only pages, contents, attachments, blobs once
    # assert_queries_count(4) { get gallery_pics_url(@gallery) }

    get pic_url(@pic)

    assert_response :success

    assert_select "div.selectedPic", 1 do
      assert_select "figure", 1
      assert_select "img[src*='pic']", 1
    end
  end
end
