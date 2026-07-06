# frozen_string_literal: true

require "spec_helper"

describe Decidim::BetterAccountability::Admin::ConfigForm do
  subject(:form) { described_class.from_params(attributes).with_context(context) }

  let(:organization) { create(:organization) }
  let(:attributes) { { enabled: true } }
  let(:context) { { current_organization: organization } }

  it "uses the better accountability module name" do
    expect(described_class.module_config_name).to eq(Decidim::BetterAccountability::MODULE_NAME)
  end

  it "accepts the enabled attribute" do
    expect(form).to be_valid
    expect(form.enabled).to be(true)
  end
end
