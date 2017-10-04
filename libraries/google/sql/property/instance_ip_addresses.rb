# Copyright 2017 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by chef-codegen and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

require 'google/sql/property/array'
module Google
  module Sql
    module Data
      # A class to manage data for ip_addresses for instance.
      class InstancIpAddress
        include Comparable

        attr_reader :ip_address
        attr_reader :time_to_retire
        attr_reader :type

        def to_json(_arg = nil)
          {
            'ipAddress' => ip_address,
            'timeToRetire' => time_to_retire,
            'type' => type
          }.reject { |_k, v| v.nil? }.to_json
        end

        def to_s
          {
            ip_address: ip_address.to_s,
            time_to_retire: time_to_retire.to_s,
            type: type.to_s
          }.map { |k, v| "#{k}: #{v}" }.join(', ')
        end

        def ==(other)
          return false unless other.is_a? InstancIpAddress
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            return false if compare[:self] != compare[:other]
          end
          true
        end

        def <=>(other)
          return false unless other.is_a? InstancIpAddress
          compare_fields(other).each do |compare|
            next if compare[:self].nil? || compare[:other].nil?
            result = compare[:self] <=> compare[:other]
            return result unless result.zero?
          end
          0
        end

        def inspect
          to_json
        end

        private

        def compare_fields(other)
          [
            { self: ip_address, other: other.ip_address },
            { self: time_to_retire, other: other.time_to_retire },
            { self: type, other: other.type }
          ]
        end
      end

      # Manages a InstancIpAddress nested object
      # Data is coming from the GCP API
      class InstancIpAddressApi < InstancIpAddress
        def initialize(args)
          @ip_address =
            Google::Sql::Property::String.api_parse(args['ipAddress'])
          @time_to_retire =
            Google::Sql::Property::Time.api_parse(args['timeToRetire'])
          @type = Google::Sql::Property::Enum.api_parse(args['type'])
        end
      end

      # Manages a InstancIpAddress nested object
      # Data is coming from the Chef catalog
      class InstancIpAddressCatalog < InstancIpAddress
        def initialize(args)
          @ip_address =
            Google::Sql::Property::String.catalog_parse(args[:ip_address])
          @time_to_retire =
            Google::Sql::Property::Time.catalog_parse(args[:time_to_retire])
          @type = Google::Sql::Property::Enum.catalog_parse(args[:type])
        end
      end
    end

    module Property
      # A class to manage input to ip_addresses for instance.
      class InstancIpAddress
        def self.coerce
          ->(x) { ::Google::Sql::Property::InstancIpAddress.catalog_parse(x) }
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return value if value.is_a? Data::InstancIpAddress
          Data::InstancIpAddressCatalog.new(value)
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return value if value.is_a? Data::InstancIpAddress
          Data::InstancIpAddressApi.new(value)
        end
      end

      # A Chef property that holds an integer
      class InstancIpAddressArray < Google::Sql::Property::Array
        def self.coerce
          lambda do |x|
            ::Google::Sql::Property::InstancIpAddressArray.catalog_parse(x)
          end
        end

        # Used for parsing Chef catalog
        def self.catalog_parse(value)
          return if value.nil?
          return InstancIpAddress.catalog_parse(value) \
            unless value.is_a?(::Array)
          value.map { |v| InstancIpAddress.catalog_parse(v) }
        end

        # Used for parsing GCP API responses
        def self.api_parse(value)
          return if value.nil?
          return InstancIpAddress.api_parse(value) \
            unless value.is_a?(::Array)
          value.map { |v| InstancIpAddress.api_parse(v) }
        end
      end
    end
  end
end
