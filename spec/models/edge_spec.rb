require 'spec_helper'

describe Edge do

  context "validity" do

    it "should not be valid without a previous step" do
      edge = Edge.new()
      expect(edge).not_to be_valid
    end

    it "should not be valid without a next step" do
      edge = Edge.new()

      expect(edge).not_to be_valid
    end

  end

  context "one of many edges" do

    before(:example) do
    end

    it "should be able to respond that it is the correct edge to follow" do
    end

    it "should not be valid without some way to define that choice" do
    end

    it "should be valid with some way to define that choices" do
    end

    it "should not respond incorrectly" do
    end

  end

  context "a single edge" do

    it "should know that it is a single edge" do
    end

    it "should not be valid without knowing it is" do
    end

    it "should be valid if it does know it is" do
    end

    it "should be able to respond that it is the correct edge" do
    end

  end
end
