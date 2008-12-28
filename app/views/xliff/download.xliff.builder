xml.instruct! :xml, :version => "1.0"

xml.xliff :version => "1.0" do
  xml.file :original => "global", :source_language => "en_US", :datatype => "plaintext"

  xml.body do
    for translation in @translations
      xml.trans_unit :id => translation.phrase.id do
        xml.source translation.phrase
        xml.target translation
      end
    end
  end

end
    
#<?xml version="1.0" ?>
#<xliff version="1.0">
#  <file orginal="global" source-language="en_US" datatype="plaintext">
#    <body>
#      <trans-unit id="1">
#        <source>home</source>
#        <target>ホーム</target>
#      </trans-unit>
#xml.trans-unit id => 