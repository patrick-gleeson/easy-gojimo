require 'rails_helper'

RSpec.describe 'QualificationFetcher' do
  let(:body) { 'Some body' }
  let(:status) { 200 }
  let(:etag) { 'etag_string' }

  context '(without an etag)' do
    subject { QualificationFetcher.new }

    before(:each) do
      stub_request(:get, 'https://api.gojimo.net/api/v4/qualifications')
        .to_return(status: status, body: body, headers: { 'Etag' => etag })
    end

    describe '#data' do
      it 'returns the body from the response' do
        expect(subject.data).to eq body
      end
    end

    describe '#status' do
      it 'returns the status from the response' do
        expect(subject.status).to eq status
      end
    end

    describe '#etag' do
      it 'returns the etag from the response' do
        expect(subject.etag).to eq etag
      end
    end
  end

  context '(with an etag)' do
    subject { QualificationFetcher.new(etag: etag) }

    before(:each) do
      stub_request(:get, 'https://api.gojimo.net/api/v4/qualifications')
    end

    describe '#initialize' do
      it 'sends the etag as a header' do
        subject
        expect(a_request(:get, 'https://api.gojimo.net/api/v4/qualifications')
          .with(headers: { 'If-None-Match' => etag }))
          .to have_been_made.once
      end
    end
  end

  context '(when an error connecting to the API)' do
    subject { QualificationFetcher.new }

    before(:each) do
      expect(QualificationFetcher)
        .to receive(:get)
        .and_raise(HTTParty::Error, 'An exciting network issue')
    end

    describe '#data' do
      it { expect(subject.data).to eq nil }
    end

    describe '#status' do
      it { expect(subject.status).to eq 500 }
    end

    describe '#etag' do
      it { expect(subject.etag).to eq nil }
    end
  end
end
