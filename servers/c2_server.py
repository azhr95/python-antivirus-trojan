import socket
import base64
import random
from string import ascii_lowercase

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.bind(("127.0.0.1", 1337))

s.listen(5)

print("listening on port 1337...")

while True:
    clientsocket, client_ip = s.accept()
    print("[+] recieved a connection from -> {}".format(client_ip))

    encoded_data = clientsocket.recv(4096)
    clientsocket.close()

    random_fd = open("".join(random.choices(ascii_lowercase, k = 10)), "w")
    random_fd.write(base64.b64decode(encoded_data).decode("UTF-8"))
    random_fd.close()
