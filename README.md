🛠️ Service Monitoring Script

📝 Description

The Service Monitoring Script ensures critical services are running on the system. If any monitored service is found to be inactive, the script attempts to restart it and sends an alert notification.

📌 Features

Checks the status of essential services (e.g., nginx, apache2, mysql, etc.).

Automatically restarts failed services.

Sends email alerts when a service is restarted.

Logs events for tracking service failures.

🔧 Prerequisites

Ensure the following utilities are installed:

bash

systemctl (for checking and managing services)

mailx (for email alerts, if enabled)

🚀 Usage

Make the script executable:

chmod +x service_monitor.sh

Run the script manually:

./service_monitor.sh

Automate execution using cron:

crontab -e

Add the following line to check services every 10 minutes:

*/10 * * * * /path/to/service_monitor.sh

📜 License

This project is licensed under the MIT License.

🤝 Contributing

Contributions are welcome! Feel free to submit a pull request.

📬 Contact

For questions or improvements, create an Issue in the repository or contact me at:
📧 b0900075@gmail.com

