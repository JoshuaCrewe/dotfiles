local sig = [[
<div style="color: #585756;">
    <br /><br />
    <div style="width: 800px; padding: 20px 0 17px 0 ; margin: bottom: 20px; border-top: 1px solid #585756;"><div style="float:left; width: 136px;"><img src="https://www.venncreative.co.uk/this-gif.gif" width="136" height="58" vspace="4"></div>
        <div class="style1" style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.3333em; display: block; margin-left: 40px; padding-top: 9px; float:left">
            <strong>
                Joshua<br>
                Crewe<br>
            </strong>
            Developer<br>
        </div>
        <div class="style1" style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.3333em; display: block; margin-left: 40px;padding-top: 9px; float:left">
            <span class="style1" style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.3333em;">
                59-61 Killigrew Street <br>
                Falmouth <br>
                Cornwall, TR11 3PF <br>
            </span>
        </div>

        <div class="style1" style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.3333em; display: block; margin-left: 40px;padding-top: 9px;  float:left"><strong>
            </strong>  <strong>01326 377 105 </strong><br>
            <a href="https://venncreative.co.uk" style="text-decoration: none; color: #f27666;">venncreative.co.uk</a><br />
            <a href="https://www.instagram.com/venncreative/" style="display: block; float: left;padding-top: 3px; padding-right:5px "><img src="https://venncreative.co.uk/venn-signature/inst.png" alt="VEnn creative Instagram" witdh="12" height="12"></a> 
            <a href="https://twitter.com/venncreative" style="display: block; float: left;padding-top: 3px; padding-right: 5px"><img src="https://venncreative.co.uk/venn-signature/twitter.png" alt="twitter" witdh="12" height="12"></a> 
            <a href="https://www.linkedin.com/company/10036153/" style="display: block; float: left;padding-top: 3px; padding-right:5px "><img src="https://venncreative.co.uk/venn-signature/linked.png" alt="Venn Creative LinkedIn" witdh="12" height="12"></a> 
        </div>

        <div style="clear: both;"></div>
    </div>

    <div style="clear: both;"></div>

    <div style="width: 600px; margin: 20px 0;">
    <br>
        <p class="style1" style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.3333em;font-style: italic;">
            <span style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.3333em;font-weight: bold">Privacy:</span>
            <span style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.3333em;" >Our approach to data protection is simple and clear. We use your information in a sensible way, which enables us to do our job well, without taking any liberties with your privacy. For more information visit <a href="https://venncreative.co.uk/privacy/">https://venncreative.co.uk/privacy</a></span>
        </p>
        <p class="style1" style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.3333em;font-style: italic;">
            <span style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.3333em;font-weight: bold">Note:</span>
            <span style="font-size: 13px; font-family: Arial, Helvetica, sans-serif; line-height: 1.3333em;"> If you're contacting us after hours and your email is urgent, please re-send it to <a href="mailto:support@venncreative.co.uk">support@venncreative.co.uk</a> and we will get back to you as soon as we can. </span>
        </p>
    </div>
</div>

]]

function Para(elem)
  if elem.content[1].text == "{{signature}}" then
    return pandoc.read(sig, 'html').blocks
  end
end
