from http.server import BaseHTTPRequestHandler, HTTPServer
# import time
import json
import logging
import urllib


hostName = "localhost"
serverPort = 5501
current_client = None


class VARS:
    name = "name"


class MyServer(BaseHTTPRequestHandler):

    OWNER = "owner"

    def set_current_client(self, client):
        self._current_client = client

    def get_car_owner(self, client_name):
        global current_client
        if not current_client:
            current_client = client_name

        return current_client

    def do_GET(self):
        response = {}
        logging.debug("GET request,\nPath: {}\nHeaders:\n{}\n".format(
          str(self.path), str(self.headers)))
        if '?' in self.path:
            self.path, vars = self.path.split('?', 1)
            vars_dict = urllib.parse.parse_qs(vars)
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        response[MyServer.OWNER] = self.get_car_owner(vars_dict[VARS.name][0])

        self.wfile.write(json.dumps(response).encode('utf-8'))


if __name__ == "__main__":
    webServer = HTTPServer((hostName, serverPort), MyServer)
    logging.basicConfig(level=logging.CRITICAL)
    print("Server started http://%s:%s" % (hostName, serverPort))

    try:
        webServer.serve_forever()
    except KeyboardInterrupt:
        pass
    webServer.server_close()
    print("Server stopped.")
