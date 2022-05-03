local sig = [[
Privacy 

Our approach to data protection is simple and clear. We use your
information in a sensible way, which enables us to do our job well, without
taking any liberties with your privacy. For more information visit
https://venncreative.co.uk/privacy

Note 

If you're contacting us after hours and your email is urgent, please re-send it
to support@venncreative.co.uk and we will get back to you as soon as we can. 
]]

function Para(elem)
  if elem.content[1].text == "{{signature}}" then
    return pandoc.read(sig, 'html').blocks
  end
end
