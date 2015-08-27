require 'Msisdn'

RSpec.describe MsisdnPH::Msisdn do

	describe "validate" do
		it "returns true if valid mobile number" do
			expect(MsisdnPH::Msisdn.validate("09171231234")).to eq true
		end
	end

	describe "operator" do
		it "returns the operator of the mobile number" do
			msisdn = MsisdnPH::Msisdn.new "09171231234"

			expect(msisdn.operator).to eq "GLOBE"
		end
	end

end