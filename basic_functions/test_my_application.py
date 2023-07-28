import re
from playwright.sync_api import sync_playwright
import playwright
from playwright.sync_api import Page, expect


def test_homepage_has_Playwright_in_title_and_get_started_link_linking_to_the_intro_page(page: Page):
    page.goto('https://playwright.dev/')
    expect(page).to_have_title(re.compile("Playwright"))
    get_started = page.get_by_role("link", name="Get started")
    expect(get_started).to_have_attribute("href", "/docs/intro")
    get_started.click()
    expect(page).to_have_url(re.compile(".*intro"))


def test_locators_get_by_text(page: Page):
    page.goto('https://playwright.dev/')
    get_started = page.get_by_role("link", name="Get started")
    expect(get_started).to_have_attribute("href", "/docs/intro")
    get_started.click()
    expect(page.get_by_text(text="Installation")).to_be_visible()


def test_context_API(playwright):
    browser = playwright.chromium.launch()
    context = browser.new_context()
    context.tracing.start(screenshots=True, snapshots=True, sources=True)
    page = context.new_page()
    page.goto('https://playwright.dev/')
    context.tracing.stop(path="trace.zip")
