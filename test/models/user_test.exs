defmodule Peepchat.UserTest do
  use Peepchat.ModelCase

  alias Peepchat.User

  @valid_attrs %{email: "user@example.com", password: "abcde12345", password_confirmation: "abcde12345"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "invalid email address doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joeexample.com",
      password: "1lh2bj1rjbk2",
      password_confirmation: "fdsbklew2d"})

    refute changeset.valid?
  end

  test "mis-matched password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
      password: "1lh2bj1rjbk2",
      password_confirmation: "fdsbklew2d"})

    refute changeset.valid?
  end

  test "missing password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
      password: "1lh2bj1rjbk2"})

    refute changeset.valid?
  end

  test "short password doesn't work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
      password: "1lh2b",
      password_confirmation: "1lh2b"})

    refute changeset.valid?
  end
end
