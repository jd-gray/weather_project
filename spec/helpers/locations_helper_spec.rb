require "spec_helper"

describe LocationsHelper do
  describe "#celcius_conversion" do
    it "returns calculates celcius conversion" do
      helper.celcius_conversion(100).should eq(37.78)
    end
  end
end
