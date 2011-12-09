SiriProxy-SWGDO

About:

SiriProxy-SWGDO is a Siri Proxy plugin that allows you to send commands to some of our products (the SW-04-010A for example). Although this could be very easily adapted to other interfaces or uses!

Credits:

SiriProxy-SWGDO was created by Sparky's Widgets. Please feel free to use this however you wish, just through use a mention and well be happy that we helped!

Usage:
This is still a WIP and usages features/updates documentation will be added here

Installation:

To install SiriProxy-SWGDO, add the following to your Siri Proxy config.yml file (~/.siriproxy/config.yml):

- name: 'SWGDO'
  git: 'git://github.com/SparkysWidgets/SiriProxy-SWGDO.git'
  comport: '/dev/rfcomm0'
  baudrate: 9600
  databits: 8
  stopbits: 1
  parity: 'SerialPort::NONE'

1)Stop Siri Proxy (CTRL-C or killall siriproxy)

2)Update Siri Proxy (siriproxy update)

3)Start Siri Proxy (siriproxy server)
