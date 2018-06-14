require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  def setup
    ::Sunspot.session = ::Sunspot::Rails::StubSessionProxy.new(::Sunspot.session)
    setup_api_user
    @indicator1 = Indicator.create!(title:"A",description:"B",indicator_type:"Benign")
    @address1 = Address.create!(address_input:'1.2.3.4')
    @observable1 = Observable.create!(indicator: @indicator1, object: @address1)
  end
  
  def teardown
    @observable1 = nil
    @indicator1 = nil
    @address1 = nil
    ::Sunspot.session = ::Sunspot.session.original_session
  end

  test "get list of indicators" do
    assert @address1.indicators == [@indicator1]
  end

  test "get list of observables" do
    assert @address1.observables == [@observable1]
  end

  test "can't create duplicate addresses" do
    a2 = Address.new(address_input:'1.2.3.4')
    assert a2.valid? == false
  end
  
  test "total_sightings returns 0 with no sightings" do
    # No sightings
    assert_equal 0, @address1.total_sightings
    
    # No indicator
    address2 = Address.create(address_input:'10.20.03.04')
    observable2 = Observable.create(object: address2)
    assert_equal 0, address2.total_sightings
    
    # No observable
    address3 = Address.create(address_input: '2.3.4.5')
    assert_equal 0, address3.total_sightings
  end
  
  test "total_sightings returns count from one indicator" do
    sight1 = Sighting.create(sighted_at: Time.now, description: 'Test Sighting')
    @indicator1.sightings << sight1
    
    assert_equal 1, @address1.total_sightings
  end
  
  test "total_sightings returns count from multiple indicators" do
    sight1 = Sighting.create(sighted_at: Time.now, description: 'Test Sighting 1')
    sight2 = Sighting.create(sighted_at: Time.now, description: 'Test Sighting 2')
    @indicator1.sightings << sight1
    @indicator1.sightings << sight2
    
    indicator2 = Indicator.create(title:"A2",description:"B2",indicator_type:"Benign")
    observable2 = Observable.create(indicator: indicator2, object: @address1)
    
    sight3 = Sighting.create(sighted_at: Time.now, description: 'Test Soghting 2')
    indicator2.sightings << sight3
    
    assert_equal 3, @address1.total_sightings
  end
end
