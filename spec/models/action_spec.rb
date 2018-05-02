require 'rails_helper'

RSpec.describe Action, type: :model do
  describe 'db structure' do
    it { is_expected.to have_db_column(:current).of_type(:boolean) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:entity_uid).of_type(:string) }
    it { is_expected.to have_db_column(:entity_name).of_type(:string) }
    it { is_expected.to have_db_column(:post_text).of_type(:text) }
    it { is_expected.to have_db_column(:post_link).of_type(:string) }
    it { is_expected.to have_db_column(:post_image).of_type(:string) }
    it { is_expected.to have_db_column(:redirect_url).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:provider_id).of_type(:uuid) }
  end
end
