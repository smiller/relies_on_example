require "service"

RSpec.describe "with requirement" do

  subject { Service.new.my_hounds }

  context "my_hounds" do

    describe ":breeding_stock key" do
      def requirement
        "my_hounds includes :breeding_stock"
      end

      it "is included" do
        expect(subject).to include_key(:breeding_stock, requirement)
      end
    end

    describe ":traits key" do
      def requirement
        "my_hounds includes :traits"
      end

      it "is included" do
        expect(subject).to include_key(:traits, requirement)
      end
    end

    context "using my_hounds" do
      describe "for :breeding_stock" do
        def relies_on
          "my_hounds includes :breeding_stock"
        end

        it "does something with :breeding_stock" do
          expect(subject[:breeding_stock]).to eq("Spartan")
        end
      end
      describe "for :traits" do
        def relies_on
          "my_hounds includes :traits"
        end

        it "does something with :traits" do
          expect(subject[:traits][:flewed_as]).to eq("Spartan")
        end
      end
    end

    describe "using my_hounds :breeding_stock for again" do
      def relies_on
        "my_hounds includes :breeding_stock"
      end

      it "checks something else" do
        expect(subject[:breeding_stock]).not_to eq("Athenian")
      end
    end
  end
end
