require 'spec_helper'

describe WechatIoController do

  describe "GET 'check'" do
    it "returns http success" do
      get 'check'
      response.should be_success
    end
  end

  describe "GET 'in_out'" do
    it "returns http success" do
      get 'in_out'
      response.should be_success
    end
  end

end
