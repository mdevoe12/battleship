class Side
  LAYOUT = {
    "a" => [nil, "", "", "", ""],
    "b" => [nil, "", "", "", ""],
    "c" => [nil, "", "", "", ""],
    "d" => [nil, "", "", "", ""]
  }

  attr_reader :layout

  def initialize(layout: LAYOUT)
    @layout = layout
  end
end