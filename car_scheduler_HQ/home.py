from http.server import BaseHTTPRequestHandler, HTTPServer
import time
import json

hostName = "localhost"
serverPort = 5501


class MyServer(BaseHTTPRequestHandler):

    def set_current_client(self, client):
        self._current_client = client

    def car_is_free(self, client):
        print(self.client_address)
        print(self.client_address == client)

    def do_GET(self):
        response = {}
        print("GET request,\nPath: {}\nHeaders:\n{}\n".format(
              str(self.path), str(self.headers)))
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        response['IS_FREE'] = self.car_is_free(self.client_address)

        self.wfile.write(json.dumps(response).encode('utf-8'))


if __name__ == "__main__":
    webServer = HTTPServer((hostName, serverPort), MyServer)
    print("Server started http://%s:%s" % (hostName, serverPort))

    try:
        webServer.serve_forever()
    except KeyboardInterrupt:
        pass

    webServer.server_close()
    print("Server stopped.")
