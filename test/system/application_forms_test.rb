require "application_system_test_case"

class ApplicationFormsTest < ApplicationSystemTestCase
  setup do
    @application_form = application_forms(:one)
  end

  test "visiting the index" do
    visit application_forms_url
    assert_selector "h1", text: "Application Forms"
  end

  test "creating a Application form" do
    visit application_forms_url
    click_on "New Application Form"

    check "Are you nit rourkela student" if @application_form.are_you_nit_rourkela_student
    fill_in "Contact no", with: @application_form.contact_no
    fill_in "Email", with: @application_form.email
    fill_in "Message", with: @application_form.message
    fill_in "Name", with: @application_form.name
    click_on "Create Application form"

    assert_text "Application form was successfully created"
    click_on "Back"
  end

  test "updating a Application form" do
    visit application_forms_url
    click_on "Edit", match: :first

    check "Are you nit rourkela student" if @application_form.are_you_nit_rourkela_student
    fill_in "Contact no", with: @application_form.contact_no
    fill_in "Email", with: @application_form.email
    fill_in "Message", with: @application_form.message
    fill_in "Name", with: @application_form.name
    click_on "Update Application form"

    assert_text "Application form was successfully updated"
    click_on "Back"
  end

  test "destroying a Application form" do
    visit application_forms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Application form was successfully destroyed"
  end
end
