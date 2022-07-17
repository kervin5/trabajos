# spec/graphql/types/query_type_spec.rb
require "rails_helper"

RSpec.describe Types::QueryType do
  describe "jobs" do
    let!(:jobs) { create_pair(:job) }

    let(:query) do
      "query {
        jobs {
          title
        }
      }"
    end

    subject(:result) { TrabajosSchema.execute(query).as_json }

    it "returns all jobs" do
      expect(result.dig("data", "jobs")).to match_array(
        jobs.map { |job| { "title" => job.title } }
      )
    end
  end
end
