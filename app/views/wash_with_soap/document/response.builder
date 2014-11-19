xml.instruct!
xml.tag! "soap:Envelope", "xmlns:soap" => 'http://schemas.xmlsoap.org/soap/envelope/',
                          "xmlns:xsi" => 'http://www.w3.org/2001/XMLSchema-instance',
                          "xmlns:xsd" => 'http://www.w3.org/2001/XMLSchema' do
  xml.tag! "soap:Body" do
    key = "tns:#{@operation}#{controller.soap_config.camelize_wsdl ? 'Response' : '_response'}"

    xml.tag! @action_spec[:response_tag], "xmlns" => @namespace do
      wsdl_data xml, result
    end
  end
end

