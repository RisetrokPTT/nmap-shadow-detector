# Nmap Shadow IT Detector 🕵️‍♂️

A custom **Nmap Scripting Engine (NSE)** tool designed to monitor network infrastructure and detect "Shadow IT" by identifying unauthorized services or new open ports compared to a known baseline.

## Features
- **Baseline Comparison**: Automatically flags any port that appears in the current scan but was not present in your baseline snapshot.
- **Nmap Integrated**: Native NSE script, requiring no extra dependencies outside of Nmap.
- **Security-First**: Perfect for automated compliance monitoring and infrastructure auditing.

## Installation
1. Locate your Nmap scripts directory (usually `/usr/share/nmap/scripts/` on Linux):
   ```bash
   git clone https://github.com/RisetrokPTT/nmap-shadow-detector.git
   cd nmap-shadow-detector
   ```
2. Copy .NSE file to your nmap scripts folder
   ```
   cp shadow-it-detect.nse /usr/share/nmap/scripts/
3. Update nmaps script engine
   ```
   nmap --script-updatedb
   ```
## Usage
  1. Generate your baseline file (the "known good" state):
  ```
  nmap -oG baseline.txt 192.168.1.0/24
  ```
  2. Run the scanner to detect unauthorized changes:
  ```
  nmap -p- --script shadow-it-detect.nse 192.168.1.0/24
  ```

## License
  This project is licensed under the Nmap Public Source License.
