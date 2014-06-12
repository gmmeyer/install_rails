require 'spec_helper'

describe OperatingSystem do

  context "operating systems should be valid" do

    it "shouldn't be valid if it doesn't have a brand" do
      os = OperatingSystem.new(version: "10.9")
      expect(os).not_to be_valid
    end

    it "shouldn't be valid if it doesn't have a version" do
      os = OperatingSystem.new(brand: "OSX")
      expect(os).not_to be_valid
    end

    it "should be valid if it has a brand and a version" do
      os = OperatingSystem.new(brand: "OSX", version: "10.9")
      expect(os).to be_valid
    end

  end

  context "Operating System should be able to have steps" do

    before(:example) do
      @os = OperatingSystem.create(brand: "Ubuntu", version: "14.04")
      @step = Step.create(operating_system_id: @os.id, first_step: true, step_content_id: 1)
    end

    it "should recognize the association" do
      expect(@os.steps).to be
    end

    it "should be the correct association" do
      expect(@os.steps[0]).to eql(@step)
    end

  end

end
