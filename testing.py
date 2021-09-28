from os import read
from typing import Text


ipAddress = str("192.168.1.1")
username = str("test")
password = str("test")
portMikrotik = str("20022")

argument = str("1")

openFile = open("testing.txt", "r")
readFile = openFile.read()

actionScript = str("/system script add name=test source={}".format(readFile))
# actionScript = str("/system script add name=test source='sads'")


def loginSSH():
    import paramiko
    import time
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(hostname=ipAddress, username=username, password=password, port=portMikrotik)

    stdin, stdout, stderr = ssh.exec_command(actionScript)
    print(stdout.read().decode("ascii").strip("\n"))

    ssh.close()


loginSSH()



# def main():
#     input()
#     loginSSH()

# if __name__ == "__main__":
    
