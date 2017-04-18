require 'rails_helper.rb'

feature"User adds a character" do
    scenario "User successfully navigates to character creation page from the home page" do
        visit '/welcome/index'
        click_link "Character Creator"
        visit '/char_create'
        expect(page).to have_content("Character Creator")
        expect(page).to have_field("str")
        expect(page).to have_field("dex")
        expect(page).to have_field("con")
        expect(page).to have_field("int")
        expect(page).to have_field("wis")
        expect(page).to have_field("cha")
        expect(page).to have_field("name")
        expect(page).to have_field("label")
        expect(page).to have_field("race")
        expect(page).to have_field("class")
    end

    scenario "User successfully creates a new character" do
        visit '/char_create'
        expect(page).to have_content("Character Creator")
        fill_in "str", with: "18"
        fill_in "dex", with: "17"
        fill_in "con", with: "16"
        fill_in "int", with: "15"
        fill_in "wis", with: "14"
        fill_in "cha", with: "13"
        fill_in "name", with: "Test"
        fill_in "label", with: "Tester"
        select('Dwarf', :from => 'race')
        select('Barbarian', :from => 'class')
        click_button "submit"
    end
end