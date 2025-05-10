from locust import HttpUser, task,between

class JsonPlaceholderUser(HttpUser):
    wait_time=between(1,2)
    host="http://jsonplaceholder.typicode.com"

    @task
    def get_users(self):
            self.client.get("/users")