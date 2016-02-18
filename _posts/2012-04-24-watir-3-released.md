---
layout: post
title: Watir 3 Released!
date: 2012-04-24 18:46
author: bpettichord
comments: true
categories: [Releases]
---
Hello everyone! 

I'm happy to announce that Watir 3 has been finally released! 
Its biggest goal is to conform even better with WatirSpec making it more 
compliant with Watir-WebDriver. 

Changelog is quite long, but reading it makes your life easier: 
* Browser#status returns an empty string if status bar is disabled in IE9 
* Browser#style fixed for IE9 
* #execute_script evaluates JavaScript code inside of an anonymous function 
- use "return" statement if value is needed by Ruby 
* #execute_script returns nil instead of 'undefined' 
* drag and drop fixed for IE9 
* Window#current? and Window#== are more robust 
* all html elements are now supported (even html5 ones) 
* CookieManager removed 
* cookies API support added ( 
https://github.com/watir/watirspec/blob/master/cookies_spec.rb) 
* drag and drop API support added ( 
https://github.com/watir/watirspec/blob/master/drag_and_drop_spec.rb) 
* Element#(before|after)? removed 
* Element#(before|after)_text removed 
* Browser#cell(s) and Browser#row(s) removed 
* Browser#Element camelCase methods removed, use under_score methods instead 
* Browser#element(s) supports only general attributes like :id, :title, 
:class_name, :text, :html and such 
* Browser#modal_dialog improved 
* Browser#send_keys and Element#send_keys have now same syntax as specified 
in WatirSpec 
* Element#style returns internal styles only for IE9, inline style will be 
returned for IE8 
* Table#each removed - use Table#(trs|rows).each instead 
* Table#row(s) and Table#cell(s) added which ignore inner tables - use 
#td/#tr for all. 
* raise an Exception if more locators are specified with :xpath/:css 
* searching by :xpath and :css code rewritten 
* Browser#textarea(s) method for searching  elements 
* Element#focus works with IE9 
* Element#focused? returns the state of focus on that element 
* Element#to_subtype returns Element if non-supported tag found instead of 
crashing 
* searching by :class will match now partially like other tools behave 
(e.g. jQuery) 
* Button#text returns value if exists instead of text 
* Browser#goto prepends url automatically with http:// if scheme is missing 
* Browser#element(s)_by_(xpath/css) are now private methods - use 
#element(:css =&gt; ...) and #element(:xpath =&gt; ...) instead 
* Browser#label supports searching by :for attribute 
* Browser#options method for searching  elements 
* Browser#body, #thead, #tfoot, #tbody, #frameset and #fieldset added 
* Browser#window and Browser#windows added implementing window switching 
API (https://github.com/jarib/watirspec/blob/master/window_switching_spec.rb 
) 
* Element#present? returns false if exception is thrown by #exists? or 
#visible? 
* Element#style returns CSS text instead of OLE object 
* Element#text returns an empty string for non-visible elements 
* Element#parent returns correct instance of Element class (e.g. Div 
instead of Element) 
* Element#focus focuses document before focusing on the element 
* Element#right_click and Element#double_click added 
* Element#to_subtype added which returns specific instance of 
Watir::Element subclass 
* Element#send_keys added 
* Element#eql? as an alias for Element#== added 
* Element#tag_name added 
* ElementCollection#[] method supports negative indexes like regular Arrays 
* ElementCollection#[] returns always an object, even if the index is out 
of bounds 
* FileField#set and Image#save uses correct Windows file path (e.g. convert 
"\"-es into "/"-es) 
* FileField#set raises Errno::ENOENT instead of WatirException if file 
doesn't exist 
* FileField#value= as an alias for FileField#set added 
* Font#color, #face and #size added 
* Form#submit triggers onSubmit event and doesn't submit the form if 
event's callback returns false 
* Frame#execute_script added 
* Image#file_size, #height and #width return integer instead of a string 
* Image#save blocking fixed 
* Meta#content and #http_equiv added 
* Option code rewritten, causing changes in its API 
* SelectList code rewritten, causing changes in its API 
* SelectList#(selected_)options returns now Options collection instead of 
an array of strings 
* Table and its subelements code rewritten, causing changes in its API 
* Table#strings and #hashes added 
* TextField#label added 
* searching elements will find only correct types - e.g. using Browser#div 
returns only DIV element even if all other provided selectors match 
* all selectors and tag of the element needs to match even if searching by 
:id 
* supporting html5 data-* attributes by using :data_* for locating and 
#data_* for retrieving attribute values 
* many other internal changes 

Please try it out by executing: 
<code>gem install watir</code>
