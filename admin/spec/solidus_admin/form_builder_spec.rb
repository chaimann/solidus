require "spec_helper"

RSpec.describe SolidusAdmin::FormBuilder do
  let(:builder) do
    described_class.new(:product, Spree::Product.new, ActionView::Base.empty, { html: { id: "_form" } })
  end

  describe "#text_field" do
    it "renders a text input" do
      result = builder.text_field(:name)
      expect(result).to include("<input")
    end
  end

  describe "#text_area" do
    it "renders a text area" do
      expect(builder.text_area(:description)).to include("<textarea")
    end
  end

  describe "#select" do
    it "renders a select box" do
      expect(builder.select(:condition, [])).to include("<select")
    end
  end

  describe "#checkbox" do
    it "renders a checkbox" do
      result = builder.checkbox(:promotionable, checked: false)
      expect(result).to include("<input")
      expect(result).to include("type=\"checkbox\"")
      expect(result).not_to include("checked=\"checked\"")
    end

    context "when :checked is not passed" do
      it "renders with correct checked value" do
        builder.object.promotionable = false
        expect(builder.checkbox(:promotionable)).not_to include("checked=\"checked\"")

        builder.object.promotionable = true
        expect(builder.checkbox(:promotionable)).to include("checked=\"checked\"")
      end
    end
  end

  describe "#checkbox_row" do
    it "renders checkboxes" do
      result = builder.checkbox_row(
        :taxon_ids,
        options: [{ id: 1, label: "One" }, { id: 2, label: "Two" }],
        row_title: "Taxons"
      )
      expect(result).to include("<input").twice
      expect(result).to include("type=\"checkbox\"").twice
      expect(result).to include("One")
      expect(result).to include("Two")
      expect(result).to include("Taxons")
    end
  end

  describe "#input" do
    it "renders an input of given type" do
      expect(builder.input(type: :text)).to match(%r{<input.+type="text"})
    end
  end

  describe "#submit" do
    it "renders submit button" do
      result = builder.submit("Save")
      expect(result).to include("<button")
      expect(result).to include("type=\"submit\"")
      expect(result).to include("form=\"_form\"")
      expect(result).to include("Save")
    end
  end
end
