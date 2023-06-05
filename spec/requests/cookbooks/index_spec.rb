# frozen_string_literal: true

RSpec.describe "Cookbooks Index", type: :request do
  let(:cookbooks) { app["persistence.rom"].relations[:cookbooks] }

  before do
    10.times { |i| cookbooks.insert(name: "Cookbook #{i}") }
  end

  it "returns a list of cookbooks" do
    get "/?page=1&per_page=3"

    expect(last_response).to be_successful
    expect(last_response.content_type).to eq("application/json; charset=utf-8")

    response_body = JSON.parse(last_response.body)

    expected_response = [
      { "name" => "Cookbook 0" },
      { "name" => "Cookbook 1" },
      { "name" => "Cookbook 2" }
    ]

    expect(response_body).to eq(expected_response)
  end

  it "return 422 with invalid params" do
    get "/?page=-1&per_page=300"

    expect(last_response).to be_unprocessable

    response_body = JSON.parse(last_response.body)

    expect(response_body).to eq(
      "errors" => {
        "page" => ["must be greater than 0"],
        "per_page" => ["must be less than or equal to 100"]
      }
    )
  end
end
