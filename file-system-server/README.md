# Simple File System Server

There are two Erlang modules:

* **simple_file_server:** Is a small and simple server with three basic operations on file system which allow clients list files, get a file and write a file in the working directory.
* **simple_file_client:** Is a client tool to interact with the server. It supports the three basic server operations.

## How to use
1) Compile server and client modules
```shell
$ erl
> c(simple_file_server).
> c(simple_file_client).
```

2) Run the server with an initial file system path
```shell
> Server = simple_file_server:start(".").
```

3) Get the list of directories and files from the `Server` instance
```shell
> simple_file_client:ls(Server).
{ok,["new_file.txt","simple_file_server.erl",
     "simple_file_client.beam","README.md",
     "simple_file_server.beam","simple_file_client.erl"]}
```

4) Create a new file
```shell
> simple_file_client:put_file(Server, "new-file.txt", "content of the file").
"File was created"
```

5) Get a file
```shell
> simple_file_client:get_file(Server, "new-file.txt").
{ok,<<"content of the file">>}
```