require 'rubygems'
require 'easypost'
EasyPost.api_key = 'qu0cNyMsUCsfeDkuzAXqKg'

to_address = EasyPost::Address.create(
  :company => 'Newaya Recycling',
  :street1 => '320 East Vine Dr.',
  :street2 => 'STE 216',
  :city => 'Fort Collins',
  :state => 'Colorado',
  :zip => '80524',
  :country => 'USA',
  :email => 'brennan@newaya.com'
)
from_address = EasyPost::Address.create(
  :company => 'Lime Solar, LLC',
  :street1 => '3090 Mountain View Dr.',
  :street2 => 'STE 190',
  :city => 'Anchorage',
  :state => 'AK',
  :zip => '99504'
)

parcel = EasyPost::Parcel.create(
  :predefined_package => 'FlatRatePaddedEnvelope',
  :weight => 30
)

shipment = EasyPost::Shipment.create(
  :to_address => to_address,
  :from_address => from_address,
  :parcel => parcel,
  :customs_info => customs_info
)

shipment.buy(
  :rate => shipment.lowest_rate("USPS", "ExpressMail"),
  :insurance => 600.00
)

puts shipment.tracking_code
puts shipment.postage_label.label_url
