# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompanyAdmin, type: :model do
  it { is_expected.to be_a_kind_of(Admin) }
end
