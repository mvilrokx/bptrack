require 'spec_helper'

describe "BloodpressureReadings" do
  describe "GET /bloodpressure_readings" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get bloodpressure_readings_index_path
      response.status.should be(200)
    end
  end
end
