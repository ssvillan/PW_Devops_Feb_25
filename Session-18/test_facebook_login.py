def test_facebook_login_title():
    from facebook import get_facebook_title
    assert "Facebook" in get_facebook_title()