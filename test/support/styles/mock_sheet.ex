defmodule MockSheet do
  use LiveViewNative.Stylesheet, :iced

  ~SHEET"""
  "color-red" do
    color(.red)
  end

  # this is a comment and isn't included in the output

  "button-" <> style do
    # this is also a comment that isn't included in the output
    buttonStyle(.<%= style %>)
  end
  """

  def class("color-" <> color_name) do
    ~RULES"""
    color(.<%= color_name %>)
    """
  end
end
