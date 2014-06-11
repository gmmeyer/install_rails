require 'spec_helper'

describe StepContent do

  context "Sanitizes the content" do

    let(:stripped_text) do
      "Here we are in the wilderness."
    end

    let(:step_content) do
      StepContent.new(title: "title")
    end

    it "should not allow scripts" do
      script_tags = stripped_text + "<script></script>"
      step_content.content = script_tags

      step_content.save
      expect(step_content.content).to eql(stripped_text)
    end

    it "should allow image tags" do
      img_tags = stripped_text + "<img src=\"asdf\">"

      step_content.content = img_tags
      step_content.save
      expect(step_content.content).to eql(img_tags)
    end


    it "should allow strong tags" do
      strong_tags = stripped_text + "<strong></strong>"

      step_content.content = strong_tags
      step_content.save
      expect(step_content.content).to eql(strong_tags)
    end

    it "should strip classes from the correct tags" do
      class_tags_allowed = stripped_text + "<a href=\"http://asdf\" class=\"asdf\">asdf</a>"
      class_tags_not_allowed = stripped_text + "<strong class='asdf'>asdf</strong>"

      step_content.content = class_tags_allowed
      step_content.save
      expect(step_content.content).to eql(class_tags_allowed)

      step_content.content = class_tags_not_allowed
      step_content.save
      expect(step_content.content).to eql(stripped_text + "<strong>asdf</strong>")
    end
  end

  context "Step content should be valid" do

    it "should not be valid without a title" do
      step_content = StepContent.new(content: 'asdf')
      expect(step_content).not_to be_valid
    end

    it "should not be valid without content" do
      step_content = StepContent.new(title: "adsf")
      expect(step_content).not_to be_valid
    end

  end

  context "Step content should create a friendly name" do

    it "should create a friendly name automatically" do
      step_content = StepContent.create(title: "adsf", content: "asdf")
      expect(step_content.step_name).to be
    end

  end

end
