# Nmap Shadow IT Detector 🕵️‍♂️

A custom **Nmap Scripting Engine (NSE)** tool designed to monitor network infrastructure and detect "Shadow IT" by identifying unauthorized services or new open ports compared to a known baseline.

## Features
- **Baseline Comparison**: Automatically flags any port that appears in the current scan but was not present in your baseline snapshot.
- **Nmap Integrated**: Native NSE script, requiring no extra dependencies outside of Nmap.
- **Security-First**: Perfect for automated compliance monitoring and infrastructure auditing.

## Installation
  Locate your Nmap scripts directory (usually `/usr/share/nmap/scripts/` on Linux):
   ```bash
   cp shadow-it-detect.nse /usr/share/nmap/scripts/
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
##Why use this?

  In modern environments, unauthorized devices or services (Shadow IT) are a primary entry point for attackers. This tool acts as an automated "tripwire" for your network segments.
  Roadmap

    [ ] Add support for service version comparison.

    [ ] Implement email/Slack alerts on detection.

    [ ] Support for JSON-formatted baseline files.

## License
  This project is licensed under the Nmap Public Source License.
