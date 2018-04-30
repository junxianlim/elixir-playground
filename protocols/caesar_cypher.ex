defprotocol CaesarCypher do
  @fallback_to_any true
  def encrypt(string, shift)
  def rot13(string)
end

defmodule CaesarCypherHelper do
  @alphabets_length 26

  def encrypt_char(char, shift) when char in ?a..?z do
    ?a + rem(char + shift - ?a, @alphabets_length)
  end

  def encrypt_char(char, shift) when char in ?A..?Z do
    ?A + rem(char + shift - ?A, @alphabets_length)
  end

  def encrypt_char(char, _shift), do: char
end

defimpl CaesarCypher, for: List do

  def encrypt(list, shift) do
    List.to_string(list)
    |> CaesarCypher.BitString.encrypt(shift)
  end

  def rot13(list), do: encrypt(list, 13)
end

defimpl CaesarCypher, for: BitString do
  def encrypt(string, shift) do
    String.to_charlist(string)
    |> Enum.map(&CaesarCypherHelper.encrypt_char(&1, shift))
    |> List.to_string
  end

  def rot13(string), do: encrypt(string, 13)
end

# Test cases
ExUnit.start()

defmodule CaesarCypherTest do
  use ExUnit.Case
  
  describe "encrypt by shifting characters" do
    test "when passing a string" do
      assert CaesarCypher.encrypt("aaa", 1) == "bbb"
      assert CaesarCypher.encrypt("zzz", 1) == "aaa"
      assert CaesarCypher.encrypt("hello world", 2) == "jgnnq yqtnf"
      assert CaesarCypher.encrypt("zzzaaaabbb,1234?", 2) == "bbbccccddd,1234?"
      assert CaesarCypher.encrypt("AaBb WorLd 11 55 && **", 1) == "BbCc XpsMe 11 55 && **"
    end

    test "when passing a list" do
      assert CaesarCypher.encrypt(["a", "a", "a"], 1) == "bbb"
      assert CaesarCypher.encrypt(["z", "z", "z"], 1) == "aaa"
      assert CaesarCypher.encrypt(['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd'], 2) == "jgnnq yqtnf"
    end
  end

  test "shifts a to z correctly by rot13" do
    assert CaesarCypher.rot13("aaa") == "nnn"
    assert CaesarCypher.rot13(["a", "a", "a"]) == "nnn"
    assert CaesarCypher.rot13("wxy") == "jkl"
  end
end