defmodule Wwwrapper.Mixfile do
  use Mix.Project

  def project do
    [ app: :wwwrapper,
      version: "0.0.1",
      elixir: "~> 0.12.2",
      escript_main_module: Wwwrapper,
      elixirc_paths: ["lib"],
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
  #  [mod: { Wwwrapper, [] }]
    [applications: [:httpotion]]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    if File.exists?("../wwweaver/") do
      [
        { :wwweaver, path: "../wwweaver/" }
      ]
    else
      [
        { :wwweaver, github: "suhrawardi/wwweaver" }
      ]
    end
  end
end
