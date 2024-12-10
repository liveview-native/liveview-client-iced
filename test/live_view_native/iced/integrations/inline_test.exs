defmodule LiveViewNative.Iced.InlineRenderTest do
  use ExUnit.Case, async: false

  import Phoenix.ConnTest
  require Phoenix.LiveViewTest
  import LiveViewNativeTest

  @endpoint LiveViewNativeTest.Endpoint

  setup do
    {:ok, conn: Plug.Test.init_test_session(build_conn(), %{})}
  end

  test "can render the override html format", %{conn: conn} do
    {:ok, lv, _body} = live(conn, "/inline", _format: :iced)

    assert lv |> element("Text") |> render() =~ "Inline Iced Render 100"
  end

  test "can render the iced format with watchos target", %{conn: conn} do
    {:ok, lv, _body} = live(conn, "/inline", _format: :iced, _interface: %{"target" => "ubuntu"})

    assert lv |> element("Text") |> render() =~ "Ubuntu Target Inline Iced Render 100"
  end
end
