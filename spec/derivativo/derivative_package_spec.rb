# frozen_string_literal: true

require 'rails_helper'

describe Derivativo::DerivativePackage do
  let(:main_uri) { 'file:///path/to/main.mov' }
  let(:requested_derivatives) { ['access'] }
  let(:service_uri) { nil }
  let(:access_uri) { nil }
  let(:poster_uri) { nil }
  let(:adjust_orientation) { 0 }

  let(:instance) do
    described_class.new(
      requested_derivatives: requested_derivatives,
      adjust_orientation: adjust_orientation,
      main_uri: main_uri,
      service_uri: service_uri,
      access_uri: access_uri,
      poster_uri: poster_uri
    )
  end

  describe '#initialize' do
    let(:service_uri) { 'file:///path/to/service.mov' }
    let(:access_uri) { 'file:///path/to/access.mp4' }
    let(:poster_uri) { 'file:///path/to/poster.tiff' }

    it 'instantiates successfully with valid parameters' do
      expect(instance).to be_a(described_class)
    end
  end

  describe '#generate_access' do
    context 'when a main_uri is present and a service_uri is not present' do
      it 'uses the main_uri as the source for an access copy' do
        expect(instance).to receive(:with_source_uri_as_file_path).with(main_uri)
        instance.generate_access
      end
    end

    context 'when a main_uri and a service_uri are present' do
      let(:service_uri) { 'file:///path/to/service.mov' }

      it 'uses the service_uri as the source for an access copy' do
        expect(instance).to receive(:with_source_uri_as_file_path).with(service_uri)
        instance.generate_access
      end
    end
  end
end
