// Email obfuscator script 2.1 by Tim Williams, University of Arizona
// Random encryption key feature by Andrew Moulden, Site Engineering Ltd
// This code is freeware provided these four comment lines remain intact
// A wizard to generate this code is at http://www.jottings.com/obfuscator/
 $(function(){ coded = "UmXVvdV7@wdVWX.yId"
     key = "C8JfIBtgSHiUEmhALXcnOrTeFwqPW9bdMGpay7KvY1Z23Q5uoNx6zV0j4kDsRl"
     shift=coded.length
     link=""
     for (i=0; i<coded.length; i++) {
         if (key.indexOf(coded.charAt(i))==-1) {
             ltr = coded.charAt(i)
             link += (ltr)
         }
         else {
             ltr = (key.indexOf(coded.charAt(i))-shift+key.length) % key.length
             link += (key.charAt(ltr))
         }
     }
     $("#mailTo").html("<a href='mailto:" + link + "'><img src=\"/Content/images/gmail-48.png\" alt=\"gmail\"  /></a>")
 });
