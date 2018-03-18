# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlaceForm, type: :form do
  subject { described_class.new(Place.new) }

  describe '#name' do
    it 'validates presence of the place name' do
      subject.validate(name: '')

      expect(subject.errors[:name]).to include('must be filled')
    end
  end

  describe '#company_id' do
    it 'validates presence of the place company_id' do
      subject.validate(company_id: '')

      expect(subject.errors[:company_id]).to include('must be filled')
    end
  end
end
