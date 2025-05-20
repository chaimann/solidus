# frozen_string_literal: true

class SolidusAdmin::UI::Table::Row::Component < SolidusAdmin::BaseComponent
  def initialize(row_object, columns, **attributes)
    @row_object = row_object
    @columns = columns
    @attributes = attributes
  end

  def cells
    @columns.map do |column|
      cell = column.data
      cell = cell.call(@row_object) if cell.respond_to?(:call)
      cell, attributes = cell
      attributes ||= {}
      cell = @row_object.public_send(cell) if cell.is_a?(Symbol)
      cell = cell.render_in(self) if cell.respond_to?(:render_in)
      cell = tag.div(cell, class: "flex items-center gap-1.5 justify-start overflow-x-hidden") if column.wrap

      tag.td(cell, class: "
        py-2 px-4 h-10 vertical-align-middle leading-none
        [tr:last-child_&:first-child]:rounded-bl-lg [tr:last-child_&:last-child]:rounded-br-lg
        #{attributes.delete(:class)}
      ", **attributes)
    end
  end
end
