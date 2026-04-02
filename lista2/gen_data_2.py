import random
from datetime import datetime, timedelta


def gen_data(file_name="server_logs.txt", size=50000):
    common_ips = [f"192.168.1.{i}" for i in range(1, 100)] + [
        f"10.0.0.{i}" for i in range(1, 50)
    ]
    heavy_ips = ["192.168.1.13", "10.0.0.7", "172.16.0.42", "192.168.1.99", "10.0.0.50"]

    possible_endpoints = [
        "/api/v1/user",
        "/api/v2/login",
        "/api/v1/data",
        "api/v2/products",
        "/api/v1/settings",
    ]
    possible_ips = common_ips + (heavy_ips * 10)
    possible_statuses = [200] * 80 + [404] * 10 + [500] * 5 + [418] * 5

    curr_time = datetime(2024, 3, 2, 0, 0, 0)

    with open(file_name, "w", encoding="utf-8") as file:
        for _ in range(size):
            curr_time += timedelta(seconds=random.randint(1, 10))

            ip = random.choice(possible_ips)
            endpoint = random.choice(possible_endpoints)
            status = random.choice(possible_statuses)

            if ip in heavy_ips:
                response_time = random.randint(300, 1500)
            else:
                response_time = random.randint(20, 200)

            timestamp_str = curr_time.strftime("%Y-%m-%dT%H:%M:%S")
            file.write(f"{timestamp_str};{ip};{endpoint};{response_time};{status}\n")


if __name__ == "__main__":
    gen_data()
