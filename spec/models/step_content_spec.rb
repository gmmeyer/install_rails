require 'spec_helper'

describe StepContent do

  context "Sanitizes the content" do

    before(:example) do
      step_content = StepContent.new(title: "title")
    end

    it "should not allow scripts" do
      
    end

    it "should allow image tags" do
    end

    it "should allow strong tags" do
    end

  end

  context "Step content should be valid" do

    it "should not be valid without a title" do
    end

    it "should not be valid without content" do
    end
    
  end

  context "Step content should create a friendly name" do

    it "should create a friendly name automatically" do
    end

  end

end
