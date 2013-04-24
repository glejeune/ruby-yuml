require 'spec_helper'

#describe YUML do
#
#  subject { YUML }
#  
#  it "trims special characters" do
#    text = "Minus-character"
#    subject.trim(text).should == "Minuscharacter"
#
#    subject.trim!(text)
#    text.should == "Minuscharacter"
#  end
#
#  it "trims multiple arguments" do
#    a, b, c, d = 'a-a', 'b-b', 'c-c', 'd-d'
#    subject.trim!(a, b, c, d)
#    a.should == 'aa'
#    b.should == 'bb'
#    c.should == 'cc'
#    d.should == 'dd'
#  end
#
#end

describe YUML::Diagram do

  it "generates yUML text" do
    yuml = YUML::activityDiagram() {
      _(:start) > _["have house"]
      _["have house"] > _("plant a tree")
      _("plant a tree") > _("plant a second tree")
      _("plant a second tree") > _(:end)
    }

    expected = <<-EXPECTED
    (start)->[have house]
    [have house]->(plant a tree)
    (plant a tree)->(plant a second tree)
    (plant a second tree)->(end)
    EXPECTED
    expected.gsub!(/\s/,'')

    yuml.to_s.gsub(/\s/,'').should == expected
  end

  it "generates proper md5" do
    yuml = YUML::activityDiagram() {
      _(:start) > _["have house"]
      _["have house"] > _("plant a tree")
      _("plant a tree") > _("plant a second tree")
      _("plant a second tree") > _(:end)
    }
    yuml.md5.should == "701e80cc95c10d11b9149f4984b2a224"
  end

  it "supports adding lines and outputting to line" do
    
    yuml = YUML::activityDiagram(){}
    
    line = yuml._(:start).to_s + '->' + yuml._["have house"].to_s
    line += '->' + yuml._("plant a tree").to_s
    line += '->' + yuml._("plant a second tree").to_s + '->' + yuml._(:end).to_s

    yuml.link_s line
    
    yuml.md5.should == "03f91cc221dcefcd0410638667456c83"
    yuml.to_line.should == "(start)->[have house]->(plant a tree)->(plant a second tree)->(end)"
  end
end
