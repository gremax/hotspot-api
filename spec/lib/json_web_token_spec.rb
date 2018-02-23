require 'rails_helper'

RSpec.describe JsonWebToken do
  let(:secret_key) { Rails.application.credentials.config[:secret_key_base] }

  describe '.encode' do
    let(:payload) { {} }

    it 'calls JWT.encode with payload and secret' do
      expect(JWT)
        .to receive(:encode)
        .with(payload, secret_key)

      described_class.encode(payload)
    end

    it 'returns the token' do
      allow(JWT)
        .to receive(:encode)
        .with(payload, secret_key)
        .and_return('jwt-token')

      expect(described_class.encode(payload)).to eq('jwt-token')
    end
  end

  describe '.decode' do
    let(:token) { 'jwt-token' }

    it 'calls JWT.decode with token and secret' do
      expect(JWT)
        .to receive(:decode)
        .with(token, secret_key)

      described_class.decode(token)
    end

    it 'returns the decoded body' do
      allow(JWT)
        .to receive(:decode)
        .with(token, secret_key)
        .and_return([{ foo: 'bar' }])

      expect(described_class.decode(token)).to eq('foo' => 'bar')
    end
  end
end
