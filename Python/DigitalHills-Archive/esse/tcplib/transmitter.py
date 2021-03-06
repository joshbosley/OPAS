'''
The MIT License

Copyright (c) 2010-2017 Josh A. Bosley, http://joshbosley.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
'''

import socket
import logging

# Send the server a message
def outgoingQuery(address, port, query, logger, timeout=10):
    
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(timeout)
    try:
        sock.connect((address, port))
    except:
        sock.close()
        logger.info("__SETUP__ERROR__")
        return -1
    
    query = query.encode()

    # Send size of request to server
    sock.sendall(str(len(query)).encode())

    # Ensure server is ready
    verification = sock.recv(4096).decode("utf-8")

    if verification != "__ACCEPTED__":
        logger.warning("__FAILED_TO_SEND_SIZE__")
        return -1
        
    # Send the data
    total = 0
    while total < len(query):
        sent = sock.send(query[total:])
        if 0 == sent:
            logger.warning("SOCKET BROKEN WHEN SENDING DATA")
        total = total + sent
        
    # Check to make sure that the server got the request	
    verification = sock.recv(4096).decode("utf-8")
    if verification != "__ACCEPTED__":
        logger.info("NO ACCEPTANCE ON MESSAGE SEND")
        return -3

    # Request sent, now get the response
    # Start by getting the size of the request
    try:
        size = sock.recv(4096)
    except:
        sock.sendall("__ERROR__")
        sock.close()
        return

    try:
        size = int(size)
    except:
        logger.warning("COULDNT VERIFY REQ SIZE FROM SERRRV")
        sock.sendall("__ERROR__".encode())
        sock.close()
        return

    # Inform the server that we accept their given size
    sock.sendall("__ACCEPTED__".encode())

    # Receive the data
    chunks = []
    bytes_recd = 0
    while bytes_recd < size:
        chunk = sock.recv(min(size - bytes_recd, 1024))
        if chunk == b'':
            logger.warning("BROKEN_SOCKET")
            return -4
        chunks.append(chunk)
        bytes_recd = bytes_recd + len(chunk)
        
    # Assemble to plaintext
    resp = (b"".join(chunks))
    
    # Tell the server that we received the data
    sock.sendall("__ACCEPTED__".encode())
    
    # Close the socket and pass back the response
    sock.close()
    return resp

'''
    Testing the sending functionality
'''
if __name__ == "__main__":

    logging.basicConfig(format='%(asctime)s [TRANSMITTER]: %(message)s <%(levelname)s>')
    thelogger = logging.getLogger(__name__)

    t = "*" * 2 ** 25
    outgoingQuery("127.0.0.1", 9000, t, thelogger)