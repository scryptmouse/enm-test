# frozen_string_literal: true

RSpec.describe ENMTest do
  it "has a version number" do
    expect(ENMTest::VERSION).not_to be nil
  end

  it "can call into Rust" do
    result = ENMTest.hello("world")

    expect(result).to eq("Hello world, from Rust!")
  end
end
