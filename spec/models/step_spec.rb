require 'spec_helper'

describe Step do

  context "validity" do

    it "should not be valid without an operating system" do
      step = Step.new(previous_step_id: 1)
      expect(step).not_to be_valid
    end

    it "should not be valid without previous steps" do
      step = Step.new(operating_system_id: 1)
      expect(step).not_to be_valid
    end

    it "can be valid without previous steps if it is the first step" do
      step = Step.new(operating_system_id: 1, first_step: true)
      expect(step).to be_valid
    end

    it "should know when it's the final step" do
      step = Step.new(operating_system_id: 1, first_step: true, final_step: true)
      expect(step.final_step).to be_truthy
    end

  end

  context "with multiple siblings" do

    before(:example) do
      @first_step = Step.create(operating_system_id: 1, first_step: true, final_step: true)
      @second_step_1 = Step.create(operating_system_id: 1, previous_step_id: @first_step.id)
      @second_step_2 = Step.new(operating_system_id: 1, previous_step_id: @first_step.id)
    end

    it "should not be valid if it is one of many next steps and does not have a choice or button text" do
      expect(@second_step_2).not_to be_valid
    end

    it "should be valid if it has a choice but not button text" do
      @second_step_2.choice = 1
      expect(@second_step_2).to be_valid
    end

    it "should be valid if it has button text but does not have a choice" do
      @second_step_2.button_text = 1
      expect(@second_step_2).to be_valid
    end

  end

  context "with multiple children" do

    before(:example) do
      @first_step = Step.create(operating_system_id: 1, first_step: true, final_step: true)
      @second_step_1 = Step.create(operating_system_id: 1, previous_step_id: @first_step.id, choice: 1)
      @second_step_2 = Step.create(operating_system_id: 1, previous_step_id: @first_step.id, choice: 2)
    end

    it "should not be valid if there is no prompt and there are multiple child steps" do
      expect(@first_step).not_to be_valid
    end

    it "should be valid if there is a prompt and there are multiple children" do
      @first_step.prompt = "hey hey hi hi"
      expect(@first_step).to be_valid
    end
  end

  context "Steps" do

    before(:example) do
      @first_step = Step.create(operating_system_id: 1, first_step: true)
      @second_step = Step.create(operating_system_id: 1, previous_step_id: @first_step.id)

    end

    it "should know the next steps" do
      expect(@first_step.next_steps).to be
      expect(@first_step.next_steps[0]).to eql(@second_step)
    end

    it "should know the previous steps" do
      expect(@second_step.previous_step).to be
      expect(@second_step.previous_step).to eql(@first_step)
    end

    it "should go to the correct next step if it only has one" do
      expect(@first_step.next_step).to eql(@second_step)
    end

    it "should choose the correct next step among many next steps" do
      @second_step_2 = Step.create(operating_system_id: 1, previous_step_id: @first_step.id, choice: "1")
      @second_step.set_choice("2")
      expect(@first_step.next_step("2")).to eql(@second_step)
    end

  end




end
