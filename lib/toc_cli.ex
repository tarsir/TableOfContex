defmodule TableOfContex.TocCli do
  @doc false
  def main(args) do
    filename = Enum.at(args, 0, "./README.md")
    if filename == "help" do
      print_help()
    else
      TableOfContex.generate_for_file(filename)
    end
  end

  defp print_help do
    IO.puts("""
    Markdown Table of Contents generator

    Usage: toc [FILENAME // "./README.md"]
    
    By default it prints to stdout. It will not automatically overwrite your
    files. :)
    """)
  end
end