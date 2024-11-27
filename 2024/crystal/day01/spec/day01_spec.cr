require "./spec_helper"

describe Day01 do
  it "runs a real test" do
    Day01.parse_numbers("1abc2").should eq [1,2]
  end
end
