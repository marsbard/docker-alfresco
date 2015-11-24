#!/usr/bin/env python

import cherrypy
from os import listdir
from os.path import isfile, join

class DnsUpdate(object):
  @cherrypy.expose
  def index(self,**params):
    f = open("/data/data.d/" + params['host'], 'w')
    f.write("+:" + params['host'] + ":" + params['ip'] + "\n")
    f.close()

    dnsfiles = [f for f in listdir('/data/data.d') if isfile(join('/data/data.d', f))]

    with open("/data/tinydns.data", 'w') as outfile:
      for fname in dnsfiles:
        with open('/data/data.d/' + fname) as infile:
          outfile.write(infile.read())

    execfile('/rebuild_tinydns-data.sh')

if __name__ == '__main__':
  cherrypy.config.update({'server.socket_port': 8053})
  cherrypy.config.update({'server.socket_host': '0.0.0.0'})
  cherrypy.quickstart(DnsUpdate(), '/')

