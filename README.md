# nmapGenerator

An bash script that can help a lot to create a huge scripts for huge number of hosts in scope.
Just type this:
./nmapGenerator.sh file_name.txt '-sn' 
Or parameter that you want.

If you want to type the output in one single file and append at the next line, just change the following line:

echo "sudo nmap $2 $ip_formatted -p $port >> output" >> scriptsGenerated.ssh


Good Hacking :D
