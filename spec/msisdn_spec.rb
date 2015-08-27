require 'Msisdn'

RSpec.describe MsisdnPH::Msisdn do

	describe "validate" do
		it "returns true if valid mobile number" do
			expect(MsisdnPH::Msisdn.validate("09171231234")).to eq true
		end

		it "returns false if invalid mobile number" do
			expect(MsisdnPH::Msisdn.validate("0918123123")).to eq false
		end
	end

	describe "operator" do
		it "returns the correct operator" do
			
			globeMsisdn = MsisdnPH::Msisdn.new "09171231234"

			smartMsisdn = MsisdnPH::Msisdn.new "09191231234"

			sunMsisdn = MsisdnPH::Msisdn.new "09321231234"

			unknownMsisdn = MsisdnPH::Msisdn.new "09511231234"


			expect(globeMsisdn.operator).to eq "GLOBE"

			expect(smartMsisdn.operator).to eq "SMART"

			expect(sunMsisdn.operator).to eq "SUN"

			expect(unknownMsisdn.operator).to eq "UNKNOWN"

		end
	end

end