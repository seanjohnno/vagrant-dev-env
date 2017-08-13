#!/usr/bin/env python
import SimpleHTTPServer
import SocketServer
import subprocess

class MyRequestHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):
    def do_GET(self):
        subprocess.call("sudo rsync -r /vagrant/www/ /usr/share/nginx/html/", shell=True)
        
        self.send_response(200)
        self.end_headers()
        self.wfile.write("File sync: OK")

Handler = MyRequestHandler
server = SocketServer.TCPServer(('0.0.0.0', 3456), Handler)

server.serve_forever()
