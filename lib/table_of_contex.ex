defmodule TableOfContex do
  @moduledoc """
  Documentation for `TableOfContex`.
  """
  @table_header ["## Table of Contents\n"]

  @doc false
  def generate_for_file(filename) do
    case File.read(filename) do
      {:ok, file} -> IO.puts(TableOfContex.generate(file))
      {:error, :enoent} -> "File does not exist"
      {:error, err} -> "Unknown error: #{err}"
    end
  end

  @doc """
  Generate a 
  """
  def generate(markdown_string) do
    if String.contains?(markdown_string, "## Table of Contents") do
      markdown_string
    else
      add_toc(markdown_string)
    end
  end

  defp add_toc(markdown_string) do
    lines = String.split(markdown_string, "\n")
    section_heads = Enum.filter(lines, &(String.starts_with?(&1, "##")))
    sections_formatted = build_toc(section_heads)
    if Enum.empty?(sections_formatted) do
      markdown_string
    else
      {summary, main_body} = split_by_toc_position(lines)

      [summary, @table_header, sections_formatted, [], main_body]
      |> Enum.map(&(Enum.join(&1, "\n")))
      |> Enum.join("\n")
    end
  end

  defp split_by_toc_position(lines) do
    Enum.split_while(lines, fn line ->
      !String.starts_with?(line, "##")
    end)
  end

  defp build_toc(section_heads) do
    section_heads
    |> Enum.map(fn header ->
      [_empty, header_depth, header] = String.split(header, ~r{#+}, parts: 2, include_captures: true)
      trimmed_header = String.trim(header)
      header_indents =
        header_depth
        |> String.slice(1..10)
        |> String.replace("#", "  ")
      section_link =
        trimmed_header
        |> String.downcase()
        |> String.replace(" ", "-")
      "#{header_indents}* [#{trimmed_header}](\##{section_link})"
    end)
  end
end
