# Source  <https://www.stephenwagner.com/2018/08/21/windows-server-2012-r2-net-windows-updates-fail-error-0x80092004/> 

You may notice on Windows Server 2012 R2, when applying Windows Updates that one or more .NET updates may fail with error code 0x80092004. This issue may affect all, or only some of your Windows Server 2012 R2 servers.
When troubleshooting this, you may notice numerous specific errors such as “Couldn’t find the hash of component: NetFx4-PenIMC”, or errors with a CAB file. These errors will probably come from update KB4054566 and KB4340558.
 
The Fix
To resolve this, we are going to download the updates MSU files from the Microsoft Update Catalog, and fully uninstall, then re-install the problematic updates.
Please Note: Always make sure you have a full backup before making modifications to your servers.
Please follow the instructions below:
1. Create a folder called “updatefix” on the root of your C drive on the server

2. Navigate to the Windows Update catalog at: https://www.catalog.update.microsoft.com/

3. Search for KB4054566 and download the file for “Windows Server 2012 R2”, save it to the folder you created above called “updatefix” on the root of your C Drive. There should be one file in the download.

4. Search for KB4340558 and download the files for “Windows Server 2012 R2”, save it to the folder you created above called “updatefix” on the root of your C Drive. There should be a total of 3 files in this download.

5. Create a folder in the “updatefix” folder called “expanded”.

6. Open an elevated command prompt, and run the following commands to extract the updates CAB files:
expand -f:* "C:\updatefix\windows8.1-kb4338415-x64_cc34d1c48e0cc2a92f3c340ad9a0c927eb3ec2d1.msu" C:\updatefix\expanded\
expand -f:* "C:\updatefix\windows8.1-kb4338419-x64_4d257a38e38b6b8e3d9e4763dba2ae7506b2754d.msu" C:\updatefix\expanded\
expand -f:* "C:\updatefix\windows8.1-kb4338424-x64_e3d28f90c6b9dd7e80217b6fb0869e7b6dfe6738.msu" C:\updatefix\expanded\
expand -f:* "C:\updatefix\windows8.1-kb4054566-x64_e780e6efac612bd0fcaf9cccfe15d6d05c9cc419.msu" C:\updatefix\expanded\

7. Now let’s uninstall the problematic updates. Some of these commands may fail depending on which updates you have successfully installed. Run the following commands individually to remove the updates:
dism /online /remove-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4338424-x64.cab
dism /online /remove-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4338419-x64.cab
dism /online /remove-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4338415-x64.cab
dism /online /remove-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4054566-x64.cab

8. Now let’s cleanly install the updates. All of these commands should be successful when running. Run the following commands individually to install the updates:
dism /online /add-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4054566-x64.cab
dism /online /add-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4338415-x64.cab
dism /online /add-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4338419-x64.cab
dism /online /add-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4338424-x64.cab

9. You have now fixed the issue and all updates should now be cleanly installing via Windows Updates!

#################################################################################################################

All in 1 script:

expand -f:* "C:\updatefix\windows8.1-kb4338415-x64_cc34d1c48e0cc2a92f3c340ad9a0c927eb3ec2d1.msu" C:\updatefix\expanded\
expand -f:* "C:\updatefix\windows8.1-kb4338419-x64_4d257a38e38b6b8e3d9e4763dba2ae7506b2754d.msu" C:\updatefix\expanded\
expand -f:* "C:\updatefix\windows8.1-kb4338424-x64_e3d28f90c6b9dd7e80217b6fb0869e7b6dfe6738.msu" C:\updatefix\expanded\
expand -f:* "C:\updatefix\windows8.1-kb4054566-x64_e780e6efac612bd0fcaf9cccfe15d6d05c9cc419.msu" C:\updatefix\expanded\
dism /online /remove-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4338424-x64.cab /NoRestart
dism /online /remove-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4338419-x64.cab /NoRestart
dism /online /remove-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4338415-x64.cab /NoRestart
dism /online /remove-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4054566-x64.cab /NoRestart
dism /online /add-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4054566-x64.cab /NoRestart
dism /online /add-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4338415-x64.cab /NoRestart
dism /online /add-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4338419-x64.cab /NoRestart
dism /online /add-package /packagepath:C:\updatefix\expanded\Windows8.1-KB4338424-x64.cab /NoRestart

