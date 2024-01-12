Hometask #5 (14/10)
===================

1. create AWS ec2 instance using ubuntu 22.04 image ami-053b0d53c279acc90
2. create script which will configure next systemd daemon:
  - daemon check some folder1 and move any new files from it to folder2  
  - daemon should autostart with system. Put next lines to user data:
    ```bash
    systemctl daemon-reload
    systemctl start your_servide
    systemctl enable your_servide 
    ```

Tip: do not forget make infinity loop in your move-script        

Check:
------
run aws run_instance
ssh to your instance
create files in folder1 and check folder2

Guide
-----

- Login to the EC2 instance
```bash
ssh -i ../diana-key-pair.pem ubuntu@ip-address-ec2-instance
```

- Check `folder1`
```bash
ls -1 folder1
```

- After some time the files from `folder1` are moved to `folder2`
```bash
ls -1 folder2
```
