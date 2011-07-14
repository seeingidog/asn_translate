require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "AsnTranslate" do
  it "translates an Autonomous System number into it's assigned organization" do
    ASNTranslate.translate_asn(32244).should == "LIQUID-WEB-INC - Liquid Web, Inc."
  end
end
