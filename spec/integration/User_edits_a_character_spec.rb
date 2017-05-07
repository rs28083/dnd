require 'rails_helper.rb'

feature"User edits and deletes a character" do
    scenario "User creates a character then updates" do
        visit '/welcome/index'
        click_on "Sign Up"
        fill_in "username", with: 'tester1'
        fill_in "email", with: 'tester@gmail.com'
        fill_in "password", with: 'tester1'
        fill_in "passwordC", with: 'tester1'
        click_on "Create Account"
        click_on "Home"
        
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
        click_on "UPDATE"
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
        expect(page).to have_content("18")
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
        
        visit '/welcome/index'
        click_on "Sign Up"
        fill_in "username", with: 'tester1'
        fill_in "email", with: 'tester@gmail.com'
        fill_in "password", with: 'tester1'
        fill_in "passwordC", with: 'tester1'
        click_on "Create Account"
        click_on "Home"
        
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
        click_on "DELETE"
        expect(page).to have_content("D&D Assistant")
    end
    
end