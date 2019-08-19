require "rails_helper"

describe Movie do
  it { is_expected.to belong_to :genre }
  it { is_expected.to have_many :comments }
end