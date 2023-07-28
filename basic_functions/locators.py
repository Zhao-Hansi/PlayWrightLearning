import pytest
import playwright


@pytest.mark.skip_browser('firefox')
def test_visit_example(page):
    page.goto('https://example.com')
