defmodule LiveViewNative.Iced.TemplateRenderTest do
  use ExUnit.Case, async: false

  import Phoenix.ConnTest
  require Phoenix.LiveViewTest
  import LiveViewNativeTest

  @endpoint LiveViewNativeTest.Endpoint

  setup do
    {:ok, conn: Plug.Test.init_test_session(build_conn(), %{})}
  end

  test "can render the override iced format", %{conn: conn} do
    {:ok, lv, _body} = live(conn, "/template", _format: :iced)

    assert lv |> element("Text") |> render() =~ "Template Iced Render 100"
  end

  test "can render the override iced format with ubuntu target", %{conn: conn} do
    {:ok, lv, _body} = live(conn, "/template", _format: :iced, _interface: %{"target" => "ubuntu"})

    assert lv |> element("Text") |> render() =~ "Ubuntu Target Template Iced Render 100"
  end
end
