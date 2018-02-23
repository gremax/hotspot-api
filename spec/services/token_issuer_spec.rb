require 'rails_helper'

RSpec.describe TokenIssuer, type: :service do
  let!(:admin) { create(:admin) }

  describe '#call' do
    it 'calls JsonWebToken.encode' do
      expect(JsonWebToken).to receive(:encode).with(user_id: admin.id).and_return('jwt-token')

      described_class.new(admin.email, admin.password).call
    end

    it 'returns the token' do
      allow(JsonWebToken).to receive(:encode).with(user_id: admin.id).and_return('jwt-token')

      expect(described_class.new(admin.email, admin.password).call).to be_eql('jwt-token')
    end

    context 'with invalid credentials' do
      it 'does not call JsonWebToken.encode' do
        expect(JsonWebToken).not_to receive(:encode)

        described_class.new('user@example.com', 'wrong-password').call
      end

      it 'does not call JsonWebToken.encode' do
        expect(JsonWebToken).not_to receive(:encode)

        described_class.new('wrong-user@example.com', 'password').call
      end
    end
  end
end
