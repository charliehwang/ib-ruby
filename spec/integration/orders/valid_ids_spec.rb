require 'integration_helper'

shared_examples_for 'Received single id' do
  subject { @received[:NextValidID].first }

  after(:all) { clean_connection }

  it { @received[:NextValidID].should have_exactly(1).message }

  it 'receives next valid for Order placement' do
    subject.should be_an IB::Messages::Incoming::NextValidID
    subject.order_id.should be_an Integer
    @id[:at_connect] ||= subject.order_id # just assign once
  end

  it 'logs next valid order id' do
    should_log /Got next valid order id/
  end
end

shared_examples_for 'Received single id after request' do
  subject { @received[:NextValidID].first }

  it_behaves_like 'Received single id'

  it 'no new id is generated by this request' do
    subject.order_id.should == @id[:at_connect]
  end

  it 'does not receive :OpenOrderEnd message' do
    @received[:OpenOrderEnd].should be_empty
  end

  it 'does not reconnect to server' do
    should_not_log /Connected to server/
  end
end

describe 'Ids valid for Order placement', :connected => true, :integration => true do

  before(:all) do
    verify_account
    connect_and_receive :NextValidID, :OpenOrderEnd, :Alert
    wait_for(2) { received? :OpenOrderEnd }
    @id = {} # Moving id between contexts. Feels dirty.
  end

  after(:all) { close_connection }

  context 'at connect' do

    it_behaves_like 'Received single id'

    it { @received[:OpenOrderEnd].should have_exactly(1).message }

    it 'receives also :OpenOrderEnd message' do
      @received[:OpenOrderEnd].first.should be_an IB::Messages::Incoming::OpenOrderEnd
    end

    it 'logs connection notification' do
      should_log /Connected to server, version: 53, connection time/
    end
  end # at connect

  context 'Requesting valid order ids' do
    before(:all) do
      @ib.send_message :RequestIds
      wait_for 1 # sec
    end

    it_behaves_like 'Received single id after request'
  end # Requesting valid order ids

  context 'Requested number of valid ids is just silently ignored by TWS' do
    before(:all) do
      @ib.send_message :RequestIds, :number => 5
      wait_for 1 # sec
    end

    it_behaves_like 'Received single id after request'
  end # Requesting valid order ids

end # Ids valid for Order placement

