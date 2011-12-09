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

class SiriProxy::Plugin::SWGDO < SiriProxy::Plugin
  def initialize(config)
    comport = config["comport"]
    baudrate = config["combaud"]
    databits = config["comdbits"]
    stopbits = config["comsbits"]
    parity = config["SerialPort::NONE"]
  end

  listen_for /test bluetooth/i do
    say "Sparkys Interface is up and running!"   

    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  listen_for /open door.*([0-9])/i do |number|
    say "opening door #{number}" #say something to the user!
	sp = SerialPort.new(comport, baudrate, databits, stopbits, parity)
	#sp.write "C#{number}"
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
  
end
