require 'spec_helper'

describe Rarity do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:abbreviation) }
end
