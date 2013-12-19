require 'spec_helper'

describe Miniature do
  it { should validate_presence_of :name }
  it { should validate_presence_of :release }
  it { should validate_presence_of :number }
  it { should validate_numericality_of :number }

  let(:miniature) { build(:miniature,
    release: release,
    type: type,
    subtype: subtype,
    size: size,
    rarity: rarity
  ) }
  let(:release) { nil }
  let(:type) { nil }
  let(:subtype) { nil }
  let(:size) { nil }
  let(:rarity) { nil }

  describe "#release_name" do
    context "when there is no release" do
      it "returns an empty string" do
        expect(miniature.release_name).to eq ""
      end
    end

    context "when there is a release" do
      let (:release) { build(:release, name: "Foo") }
      it "returns the name of the release the miniature belongs to" do
        expect(miniature.release_name).to eq "Foo"
      end
    end
  end

  describe "#type_name" do
    context "when there is no type" do
      it "returns an empty string" do
        expect(miniature.type_name).to eq ""
      end
    end

    context "when there is a type" do
      let(:type) { build(:type, name: "Foo") }
      it "returns the name of the type the miniature belongs to" do
        expect(miniature.type_name).to eq "Foo"
      end
    end
  end

  describe "#subtype_name" do
    context "when there is no subtype" do
      it "returns an empty string" do
        expect(miniature.subtype_name).to eq ""
      end
    end

    context "when there is a subtype" do
      let(:subtype) { build(:subtype, name: "Foo") }
      it "returns the name of the subtype the miniature belongs to" do
        expect(miniature.subtype_name).to eq "Foo"
      end
    end
  end

  describe "#size_abbreviation" do
    context "when there is no size" do
      it "returns an empty string" do
        expect(miniature.size_abbreviation).to eq ""
      end
    end

    context "when there is a size" do
      let(:size) { build(:size, abbreviation: "F") }
      it "returns the name of the size the miniature belongs to" do
        expect(miniature.size_abbreviation).to eq "F"
      end
    end
  end

  describe "#rarity_abbreviation" do
    context "when there is no rarity" do
      it "returns an empty string" do
        expect(miniature.rarity_abbreviation).to eq ""
      end
    end

    context "when there is a rarity" do
      let(:rarity) { build(:rarity, abbreviation: "F") }
      it "returns the name of the rarity the miniature belongs to" do
        expect(miniature.rarity_abbreviation).to eq "F"
      end
    end
  end
end
