class Address < ActiveRecord::Base
  belongs_to :city

  def name
    [city.state.country.name, city.state.name, city.name, zip, raw_line].join ', '
  end
end
