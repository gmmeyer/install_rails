require 'spec_helper'

describe Step do

  context "Steps should be valid" do

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

    it "should not be valid if it is one of many next steps and does not have a choice" do

      first_step = Step.create(operating_system_id: 1, first_step: true, final_step: true)
      second_step = Step.create(operating_system_id: 1, previous_step_id: first_step.id)
      second_step_1 = Step.new(operating_system_id: 1, previous_step_id: first_step.id)

      expect(second_step_1).not_to be_valid
    end

  end

  context "It should go to the correct next step" do

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
