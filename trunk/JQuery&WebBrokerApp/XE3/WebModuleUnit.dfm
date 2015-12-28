object WebModuleMain: TWebModuleMain
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      Producer = PageProducer1
    end>
  Height = 230
  Width = 415
  object PageProducer1: TPageProducer
    HTMLDoc.Strings = (
      '<!DOCTYPE html> '
      '<html> '
      #9'<head> '
      #9'<title><#doctitle></title>'
      
        '        <meta name="viewport" content="width=device-width, initi' +
        'al-scale=1">'
      
        #9'<link rel="stylesheet" href="http://code.jquery.com/mobile/1.2.' +
        '0/jquery.mobile-1.2.0.min.css" />'
      
        #9'<script src="http://code.jquery.com/jquery-1.8.2.min.js"></scri' +
        'pt>'
      
        #9'<script src="http://code.jquery.com/mobile/1.2.0/jquery.mobile-' +
        '1.2.0.min.js"></script></head>'
      '<body> '
      ''
      '<#docbody>'
      ''
      '</body>'
      '</html>')
    OnHTMLTag = PageProducer1HTMLTag
    Left = 168
    Top = 96
  end
end
