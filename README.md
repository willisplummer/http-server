# HTTP SERVER

I'm building an http server in C to learn how this all works.

## Plan:
### Listen on Port
- [ ] create socket ( `socket()` ), bind socket to port ( `bind()` ), listen for connections (`listen()`),
### Request Handling
- [ ] accept connection (`accept()`)
    - get the client (requester) address and create a client socket using `accept`
- [ ] read from the socket to a buffer (`read()`)
- [ ] send a response (`write()`)
- [ ] close the connection (`close(client_socket)`)
### Parse HTTP Requests
- should handle GET, POST, PUT, DESTROY
https://datatracker.ietf.org/doc/html/rfc2616
https://datatracker.ietf.org/doc/html/rfc9114
### Serve Files
- return html, pdf, png at least
### Handle multiple requests
- `fork()` or `select()`

## MAKE

```
make clean
make
make compile_commands.json
./program
```
