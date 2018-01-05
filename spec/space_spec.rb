describe Space do
  let(:booking){double(:booking, {start_date: Date.parse("2018-01-11"), end_date: Date.parse("2018-01-15")}) }
  describe "is available" do
    it "return true if the dates do not overlap with the dates of any current bookings" do
      allow(subject).to receive(:bookings).and_return([booking])
      expect(subject.is_available?(Date.parse("2018-01-11")..Date.parse("2018-01-15"))).to eq false
    end
  end
end
