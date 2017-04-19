require 'rails_helper.rb'

feature"User edits and deletes a character" do
    scenario "User creates a character then updates" do
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
        click_button "UPDATE"
        fill_in "str", with: "17"
        fill_in "dex", with: "16"
        fill_in "con", with: "15"
        fill_in "int", with: "14"
        fill_in "wis", with: "13"
        fill_in "cha", with: "12"
        fill_in "name", with: "Tested"
        fill_in "label", with: "Testered"
        select('Elf', :from => 'race')
        select('Wizard', :from => 'class')
        click_button "submit"
        
        expect(page).to have_content("17")
        expect(page).to have_content("16")
        expect(page).to have_content("15")
        expect(page).to have_content("14")
        expect(page).to have_content("13")
        expect(page).to have_content("12")
        expect(page).to have_content("Tested")
        expect(page).to have_content("Testered")
        expect(page).to have_content("Elf")
        expect(page).to have_content("Wizard")
    end
    scenario "User creates a character then deletes" do
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
        click_button "DELETE"
        expect(page).to have_content("D&D Assistant")
    end
    
end