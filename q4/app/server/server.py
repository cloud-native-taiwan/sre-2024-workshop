from http.server import SimpleHTTPRequestHandler, HTTPServer
import os

class MyHTTPRequestHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello, world!")

host = os.getenv('HOST', 'localhost')
port = int(os.getenv('PORT', 8080))

server = HTTPServer((host, port), MyHTTPRequestHandler)

print(f"Server started at http://{host}:{port}")
server.serve_forever()
