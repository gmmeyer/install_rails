require 'spec_helper'

describe Step do

  context "Sanitized content" do

    let(:stripped_text) do
      "Here we are in the wilderness."
    end

    let(:step) do
      Step.new(title: "title")
    end

    it "should not allow scripts" do
      script_tags = stripped_text + "<script></script>"
      step.content = script_tags

      step.save
      expect(step.content).to eql(stripped_text)
    end

    it "should allow image tags" do
      img_tags = stripped_text + "<img src=\"asdf\">"

      step.content = img_tags
      step.save
      expect(step.content).to eql(img_tags)
    end


    it "should allow strong tags" do
      strong_tags = stripped_text + "<strong></strong>"

      step.content = strong_tags
      step.save
      expect(step.content).to eql(strong_tags)
    end

    it "should strip classes from the correct tags" do
      class_tags_allowed = stripped_text + "<a href=\"http://asdf\" class=\"asdf\">asdf</a>"
      class_tags_not_allowed = stripped_text + "<strong class='asdf'>asdf</strong>"

      step.content = class_tags_allowed
      step.save
      expect(step.content).to eql(class_tags_allowed)

      step.content = class_tags_not_allowed
      step.save
      expect(step.content).to eql(stripped_text + "<strong>asdf</strong>")
    end

    it "should sanitize the trouble field as well" do
      script_tags = stripped_text + "<script></script>"
      step.content = stripped_text
      step.trouble = script_tags

      step.save
      expect(step.trouble).to eql(stripped_text)
    end
  end

  context "Steps should be valid" do

    it "should not be valid without a title" do
      step = Step.new(content: 'asdf')
      expect(step).not_to be_valid
    end

    it "should not be valid without content" do
      step = Step.new(title: "adsf")
      expect(step).not_to be_valid
    end

  end

  context "Step should create a permalink" do

    it "should create a friendly name automatically" do
      step = Step.create(title: "adsf", content: "asdf")
      expect(step.permalink).to be
    end

  end

end
