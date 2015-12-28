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
      
        #9'<link rel="stylesheet" href="http://code.jquery.com/mobile/1.0a' +
        '3/jquery.mobile-1.0a3.min.css" />'
      
        #9'<script type="text/javascript" src="http://code.jquery.com/jque' +
        'ry-1.4.3.min.js"></script>'
      
        #9'<script type="text/javascript" src="http://code.jquery.com/mobi' +
        'le/1.0a3/jquery.mobile-1.0a3.min.js"></script>'
      '</head> '
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
