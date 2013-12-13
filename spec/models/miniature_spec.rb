require 'spec_helper'

describe Miniature do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:subtype) }
end
