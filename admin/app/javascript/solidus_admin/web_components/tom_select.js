import TomSelect from "tom-select";

class TomSelectElement extends HTMLSelectElement {
  static observedAttributes = ["is"]

  connectedCallback() {
    const originalSelect = this;

    const tomselect = new TomSelect(originalSelect, {
      controlClass: "flex flex-wrap items-center gap-1 rounded-sm w-full text-black bg-white border border-gray-300 rounded-sm placeholder:text-gray-400 " +
        "hover:border-gray-500 focus:ring focus:ring-gray-300 focus:ring-0.5 focus:bg-white focus:ring-offset-0 " +
        "[&:focus-visible]:outline-none disabled:bg-gray-50 disabled:text-gray-500 disabled:placeholder:text-gray-300 " +
        "disabled:cursor-not-allowed invalid:border-red-600 invalid:hover:border-red-600 invalid:text-red-600 " +
        "aria-invalid:border-red-600 aria-invalid:hover:border-red-600 aria-invalid:text-red-600 form-select " +
        "bg-arrow-down-s-fill-gray-700 invalid:bg-arrow-down-s-fill-red-400 aria-invalid:bg-arrow-down-s-fill-red-400 " +
        "aria-expanded:bg-arrow-up-s-fill-gray-700 form-control-md pl-3 pr-10 py-1.5 font-normal text-sm min-h-9",
      controlInput: originalSelect.multiple ? '<input type="text" autocomplete="off" size="1" />' : null,
      dropdownClass: "w-full absolute border border-gray-100 mt-0.5 flex flex-col min-w-[10rem] p-2 rounded-sm shadow-lg bg-white z-10 text-sm",
      dropdownContentClass: "[&>*]:p-2 [&>*]:rounded-sm [&>*:hover]:bg-gray-50 [&>*]:text-black [&>*]:min-w-fit",
      plugins: {
        no_active_items: true,
        remove_button: {
          append: originalSelect.multiple,
          className: "text-xl hover:cursor-pointer pb-0.5"
        },
      },
      maxOptions: null,
      onBlur: function() {
        // if (this.settings.mode === "single") return;

        this.control.classList.remove("ring", "ring-gray-300", "ring-0.5", "bg-white", "ring-offset-0", "outline-none");
      },
      onFocus: function() {
        // if (this.settings.mode === "single") return;

        this.control.classList.add("ring", "ring-gray-300", "ring-0.5", "bg-white", "ring-offset-0", "outline-none");
      },
      render: {
        item: function(data) {
          const div = document.createElement("div");
          div.innerText = data.text;
          if (this.settings.mode === "single") return div;
          div.className = "flex gap-2 items-center rounded-full whitespace-nowrap px-2 py-0.5 text-sm font-normal text-black bg-graphite-light h-5.5";
          return div;
        },
      },
      wrapperClass: "w-full relative"
    });

    tomselect.control_input.style = "background: none !important;\n" +
      "border: 0 !important;\n" +
      "box-shadow: none !important;\n" +
      "display: inline-block !important;\n" +
      "flex: 1 1 auto;\n" +
      "line-height: inherit !important;\n" +
      "margin: 0 !important;\n" +
      "max-height: none !important;\n" +
      "max-width: 100% !important;\n" +
      "min-height: 0 !important;\n" +
      "min-width: 7rem;\n" +
      "padding: 0 !important;\n" +
      "text-indent: 0 !important;\n" +
      "-webkit-user-select: auto !important;\n" +
      "-moz-user-select: auto !important;\n" +
      "-ms-user-select: auto !important;\n" +
      "user-select: auto !important;\n" +
      "outline: none !important;"

    originalSelect.classList.add("hidden");

  }
}

customElements.define("tom-select", TomSelectElement, { extends: "select" });
