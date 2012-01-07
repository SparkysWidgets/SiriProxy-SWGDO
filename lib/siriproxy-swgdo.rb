# Copyright (C) 2011 by Sparky's Widgets <sparkyswidgets@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


#######
# This is just the basic gem to interface serial ports, siri, and various hardware interfaces
# such as relay boards, temp sensors, fans, pumps and many other things!
#
#######

require 'cora'
require 'siri_objects'
require 'pp'
require 'serialport'

class SiriProxy::Plugin::SWGDO < SiriProxy::Plugin
  def initialize(config)
    _comport = config["comport"]
    _baudrate = config["baudrate"]
    _databits = config["databits"]
    _stopbits = config["stopbits"]
    _parity = config["parity"]
  end

  listen_for /test bluetooth/i do
    say "Sparkys Interface is up and running!"   

    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

 listen_for /open garage door/i do
    response = ask "Which Door?" #ask the user for something
      if(response =~ /one/i) #process their response
       say "opening door 1!"
      end
       if(response =~ /two/i) #process their response
       say "opening door 2!"
         sp = SerialPort.new(_comport, _baudrate, _databits, _stopbits, _parity)
	sp.write "C2"
      end
   request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end 
 
end
