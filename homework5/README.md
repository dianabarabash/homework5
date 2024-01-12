Hometask #5 (14/10)
===================
Guide
-----

- Start instance
```bash
./run-and-provision.sh
```


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
