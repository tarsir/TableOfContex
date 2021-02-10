defmodule TableOfContexTest do
  use ExUnit.Case
  doctest TableOfContex

  test "works on basic README.md" do
    readme = ~s"""
    # Test

    This is a test README.

    ## Section 1

    test

    ### Section 1.a

    hi

    ### Section 1.b

    hello

    ## Section 2

    yo

    ### Section 2.a

    hay

    #### Section 2.a.i

    whoa

    ##### Section 2.a.i.A

    deep

    """
    generated = TableOfContex.generate(readme)
    assert String.contains?(generated, "* [Section 1](#section-1)")
    assert String.contains?(generated, "This is a test README.")
  end
end
