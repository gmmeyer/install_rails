require 'spec_helper'

describe Edge do

  context "validity" do

    it "should not be valid without a previous step" do
      edge = Edge.new(next_step_id: 1, single_edge: true)
      expect(edge).not_to be_valid
    end

    it "should not be valid without a next step" do
      edge = Edge.new(previous_step_id: 1, single_edge: true)

      expect(edge).not_to be_valid
    end

    it "should be valid if it has a next and previous step" do
      edge = Edge.new(previous_step_id: 1, next_step_id: 2, single_edge: true)

      expect(edge).to be_valid
    end

  end

  context "one of many edges" do

    let(:step_1) do
      Step.find_by(title: "asdf")
    end

    let(:step_2_a) do
      Step.find_by(title: "asdf 2 a")
    end

    let(:step_2_b) do
      Step.find_by(title: "asdf 2 b")
    end

    let(:edge_1) do
      Edge.new(previous_step_id: step_1.id, next_step_id: step_2_a.id)
    end

    let(:edge_2) do
      Edge.new(previous_step_id: step_1.id, next_step_id: step_2_b.id)
    end

    let(:user) do
      User.find_by(os: "Mac", guest: true)
    end

    before(:example) do
      User.create(guest: true, os: 'Mac')
      Step.create(title: "asdf", content: "asdf", first_step: true)
      Step.create(title: "asdf 2 a", content: "asdf 2 a")
      Step.create(title: "asdf 2 b", content: "adsf 2 b")
    end

    it "should not be valid without some way to define that choice" do
      expect(edge_1).not_to be_valid
    end

    it "should be valid with some way to define that choices" do
      edge = edge_1
      edge.button_text = "asdf"
      expect(edge).to be_valid

      edge = edge_2
      edge.os = "Mac"
      expect(edge).to be_valid
    end

    it "should be able to respond that it is the correct edge to follow" do
      edge = edge_1
      edge.os = 'Mac'

      expect(edge.follow?(user)).to be_truthy
    end



    it "should not respond incorrectly" do
      edge = edge_2
      edge.os = 'Windows'

      expect(edge.follow?(user)).to be_falsey
    end

  end

  context "a single edge" do

    let(:edge) do
      Edge.new(previous_step_id: 1, next_step_id: 2)
    end

    let(:single_edge) do
      Edge.new(previous_step_id: 1, next_step_id: 2, single_edge: true)
    end


    it "should not be valid without knowing it is" do
      expect(edge).not_to be_valid
    end

    it "should be valid if it does know it is" do
      expect(single_edge).to be_valid
    end

    it "should know that it is a single edge" do
      expect(single_edge.single?).to be_truthy
    end

    it "should be able to respond that it is the correct edge" do
      expect(single_edge.follow?).to be_truthy
      expect(edge.follow?).to be_falsey
    end
  end
end