require 'spec_helper'

describe Size do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:abbreviation) }
end
