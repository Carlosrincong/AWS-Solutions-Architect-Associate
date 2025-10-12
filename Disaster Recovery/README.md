
# Disaster Recovery

Key concepts:
- RPO: Recovery Point Objetive -> how often backups are made. 
- RTO: Recovery Time Objetive -> when recover happen after the disaster.
- Data loss: is the time between the disaster and RPO.
- Downtime: is the time between the disaster and RTO. 

Strategies:
1- Backup and restore (high RPO): Restore from backups
2- Pilot light: Data replication and a small version of the app that is ready to get all the traffic in case of disaster. The traffic only need to be redirected. For critical core systems (not for all system)
3- Warm Standby: Full system is up and running, but a minimum size. When a disaster ocurrs, the full systame scale up and is ready to hanldle the all traffic. 
4- hot site/ multi site approach (Low RTO and very expensive): active-active set up, where the both sides handle the all load
5- AWS multi-region

When the Faster RTO is 4. 

Impotant:
- Backups
- Replication
- High Availability
- Automation deploy