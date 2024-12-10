defmodule LiveViewNative.IcedTest do
  use ExUnit.Case

  alias LiveViewNative.Iced

  describe "version normalization" do
    test "normalize_os_version" do
      assert [1, 2, 3] = Iced.normalize_os_version("1.2.3")
    end

    test "normalize_app_version" do
      assert [1, 2, 3] = Iced.normalize_app_version("1.2.3")
    end
  end
end
