defmodule TableOfContexTest do
  use ExUnit.Case
  doctest TableOfContex

  test "works on basic README.md" do
    readme = File.read!("./test/files/basic.md")
    generated = TableOfContex.generate(readme)
    assert String.contains?(generated, "* [Section 1](#section-1)")
    assert String.contains?(generated, "This is a test README.")
  end

  test "does not print TOC when nothing to print" do
    readme = ~s"""
    # Test

    This is a test.
    """
    generated = TableOfContex.generate(readme)
    assert !String.contains?(generated, "Table of Contents")
  end
end
