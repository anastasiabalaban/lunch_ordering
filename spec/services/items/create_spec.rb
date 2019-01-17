# frozen_string_literal: true

require 'rails_helper'

describe Items::Create do
  subject { described_class.call(params) }

  let(:params) { attributes_for(:item) }

  it 'creates an item' do
    subject
    
    expect(Item.find_by(name: params[:name])).to be_present
  end
end
