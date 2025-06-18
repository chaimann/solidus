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

    context "with custom controller name" do
      it "returns correct data attribute" do
        expect(dummy.stimulus_controller("sortable")).to eq("data-controller": "sortable")
      end
    end
  end

  describe "#stimulus_action" do
    it "returns correct data attribute" do
      expect(dummy.stimulus_action("search")).to eq("data-action": "dummy#search")
    end

    context "with custom controller name" do
      it "returns correct data attribute" do
        expect(dummy.stimulus_action("search", controller: "table")).to eq("data-action": "table#search")
      end
    end

    context "with :on passed" do
      it "returns correct data attribute" do
        expect(dummy.stimulus_action("search", on: "change")).to eq("data-action": "change->dummy#search")
      end

      context "with custom controller name" do
        it "returns correct data attribute" do
          expect(dummy.stimulus_action("search", on: "change", controller: "table")).
            to eq("data-action": "change->table#search")
        end
      end
    end
  end

  describe "#stimulus_target" do
    it "returns correct data attribute" do
      expect(dummy.stimulus_target("input")).to eq("data-dummy-target": "input")
    end

    context "with custom controller name" do
      it "returns correct data attribute" do
        expect(dummy.stimulus_target("input", controller: "form")).to eq("data-form-target": "input")
      end
    end
  end

  describe "#stimulus_value" do
    it "returns correct data attribute" do
      expect(dummy.stimulus_value(name: "amount", value: 3)).to eq("data-dummy-amount-value": 3)
    end

    context "with custom controller name" do
      it "returns correct data attribute" do
        expect(dummy.stimulus_value(name: "amount", value: 3, controller: "calculator")).
          to eq("data-calculator-amount-value": 3)
      end
    end
  end

  describe "#stimulus_param" do
    it "returns correct data attribute" do
      expect(dummy.stimulus_param(name: "url", value: "/index")).to eq("data-dummy-url-param": "/index")
    end

    context "with custom controller name" do
      it "returns correct data attribute" do
        expect(dummy.stimulus_param(name: "url", value: "/index", controller: "list")).
          to eq("data-list-url-param": "/index")
      end
    end
  end

  describe "#stimulus_class" do
    it "returns correct data attribute" do
      expect(dummy.stimulus_class(name: "loading", value: "text-gray-100")).
        to eq("data-dummy-loading-class": "text-gray-100")
    end

    context "with custom controller name" do
      it "returns correct data attribute" do
        expect(dummy.stimulus_class(name: "loading", value: "text-gray-100", controller: "item")).
          to eq("data-item-loading-class": "text-gray-100")
      end
    end
  end
end
