# frozen_string_literal: true

require "spec_helper"

RSpec.describe SolidusAdmin::StimulusHelper, type: :helper do
  class DummyComponent
    include SolidusAdmin::StimulusHelper

    def stimulus_id
      "dummy"
    end
  end

  let(:dummy) { DummyComponent.new }

  describe "#stimulus_controller" do
    it "returns correct data attribute" do
      expect(dummy.stimulus_controller).to eq("data-controller": "dummy")
    end
  end

  describe "#stimulus_action" do
    it "returns correct data attribute" do
      expect(dummy.stimulus_action("search")).to eq("data-action": "dummy#search")
    end

    context "with :on passed" do
      it "returns correct data attribute" do
        expect(dummy.stimulus_action("search", on: "change")).to eq("data-action": "change->dummy#search")
      end
    end
  end

  describe "#stimulus_target" do
    it "returns correct data attribute" do
      expect(dummy.stimulus_target("input")).to eq("data-dummy-target": "input")
    end
  end

  describe "#stimulus_value" do
    it "returns correct data attribute" do
      expect(dummy.stimulus_value(name: "amount", value: 3)).to eq("data-dummy-amount-value": 3)
    end
  end

  describe "#stimulus_param" do
    it "returns correct data attribute" do
      expect(dummy.stimulus_param(name: "url", value: "/index")).to eq("data-dummy-url-param": "/index")
    end
  end
end
