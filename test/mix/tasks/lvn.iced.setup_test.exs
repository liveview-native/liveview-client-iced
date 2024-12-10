defmodule Mix.Tasks.Lvn.Iced.SetupTest do
  use ExUnit.Case

  import Mix.Lvn.TestHelper
  import ExUnit.CaptureIO

  alias Mix.Tasks.Lvn.Iced.Setup.Gen

  setup do
    Mix.Task.clear()
    :ok
  end

  describe "when a single app" do
    test "copies the core components file into the project", config do
      in_tmp_live_project config.test, fn ->
        capture_io(fn ->
          Gen.run([])
        end)
        assert_file "lib/live_view_native_iced_web/components/core_components.iced.ex", fn file ->
          assert file =~ "LiveViewNativeIcedWeb.CoreComponents.Iced"
          assert file =~ "import LiveViewNative.LiveForm.Component"
        end
      end
    end
  end

  describe "when an umbrella app" do
    test "copies the core components file into the project", config do
      in_tmp_live_umbrella_project config.test, fn ->
        File.cd!("live_view_native_iced_web", fn ->
          capture_io(fn ->
            Gen.run([])
          end)
          assert_file "lib/live_view_native_iced_web/components/core_components.iced.ex", fn file ->
            assert file =~ "LiveViewNativeIcedWeb.CoreComponents.Iced"
            assert file =~ "import LiveViewNative.LiveForm.Component"
          end
        end)
      end
    end
  end
end
