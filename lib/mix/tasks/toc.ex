defmodule Mix.Tasks.Toc do
  use Mix.Task

  @shortdoc "Runs the TOC generator."
  def run(args) do
    filename = Enum.at(args, 0, "./README.md")
    TableOfContex.generate_for_file(filename)
  end
end