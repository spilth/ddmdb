require 'spec_helper'

describe Miniature do
  it { should validate_presence_of :name }
  it { should validate_presence_of :type }
  it { should validate_presence_of :subtype }
  it { should validate_presence_of :release }
  it { should validate_presence_of :number }
  it { should validate_numericality_of :number }
end
