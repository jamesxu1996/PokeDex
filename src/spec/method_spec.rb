require_relative "../methods.rb"

#checks that all words in a string are capitalised
    describe 'capital' do
        it "capitalises all words in a string" do
            test_string = "this is a test string that is not capitalised."
            test_string = string_capitalize(test_string)
            expect(test_string).to eq("This Is A Test String That Is Not Capitalised.")
        end

    end