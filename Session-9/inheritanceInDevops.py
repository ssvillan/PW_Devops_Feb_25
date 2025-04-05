class Server:
    def deploy(self):
        print("Deploying on Server-1(Generic Server)")
class WebServer(Server):
        def deploy(self):
            print("Deploying web Application on WebServer")
class DBServer(Server):
        def deploy(self):
            print("Deploying Database Server....")

server=Server()
web_server=WebServer()
db_server=DBServer()


server.deploy()
web_server.deploy()
db_server.deploy()