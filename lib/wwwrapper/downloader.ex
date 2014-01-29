defmodule Wwwrapper.Downloader do

  def save(result, uri) do
    {state, msg} = result
    save(state, msg, uri, "downloads")
    result
  end

  defp save(:ok, content, uri, dir) do
    File.write(download_path(uri, dir), content)
  end

  defp save(:error, status, uri, _) do
    IO.puts "Failed to download #{uri}\nServer returned a #{status}" 
  end

  defp download_path(uri, dir) do
    get_download_path(uri, dir)
      |> prepare_download_path
  end

  defp prepare_download_path(path) do
    File.mkdir_p(Path.dirname(path))
    path
  end

  defp get_download_path(uri, dir) do
    path = URI.parse(uri).path
    if path == nil or String.last(path) == "/" do
      "#{dir}/#{path}index.html"
    else
      "#{dir}/#{path}"
    end
  end
end
