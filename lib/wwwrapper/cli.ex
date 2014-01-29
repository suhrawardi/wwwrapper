defmodule Wwwrapper.CLI do

  def run(argv) do
    argv
      |> parse_args
      |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches:  [ help: :boolean],
                                     aliases:   [ h:    :help])
    case parse do
      {[help: true], _, _}           -> :help
      {_, ["download", url], _}      -> {:download, url}
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
      usage: crawler download <url>
    """
    System.halt(0)
  end

  def process({:download, url}) do
    Wwweaver.Process.start(url, &Wwwrapper.Downloader.save(&1, &2))
  end
end
