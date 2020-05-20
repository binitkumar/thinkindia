require "application_system_test_case"

class QuestionPapersTest < ApplicationSystemTestCase
  setup do
    @question_paper = question_papers(:one)
  end

  test "visiting the index" do
    visit question_papers_url
    assert_selector "h1", text: "Question Papers"
  end

  test "creating a Question paper" do
    visit question_papers_url
    click_on "New Question Paper"

    fill_in "Title", with: @question_paper.title
    click_on "Create Question paper"

    assert_text "Question paper was successfully created"
    click_on "Back"
  end

  test "updating a Question paper" do
    visit question_papers_url
    click_on "Edit", match: :first

    fill_in "Title", with: @question_paper.title
    click_on "Update Question paper"

    assert_text "Question paper was successfully updated"
    click_on "Back"
  end

  test "destroying a Question paper" do
    visit question_papers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Question paper was successfully destroyed"
  end
end
