defmodule Mix.Tasks.Toc do
  use Mix.Task

  @shortdoc "Runs the TOC generator."
  def run(_) do
    case File.read("./README.md") do
      {:ok, file} -> IO.puts(TableOfContex.generate(file))
      {:error, :enoent} -> "File does not exist"
      {:error, err} -> "Unknown error: #{err}"
    end
  end
end