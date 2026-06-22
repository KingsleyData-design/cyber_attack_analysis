SELECT attack_type, COUNT(*) AS attack_count FROM cyber_attack_cleaned GROUP BY attack_type ORDER BY attack_count DESC;
SELECT protocol, COUNT(*) AS protocol_count FROM cyber_attack_cleaned GROUP BY protocol ORDER BY protocol_count DESC;
SELECT attack_type, AVG(duration) AS avg_duration FROM cyber_attack_cleaned GROUP BY attack_type ORDER BY avg_duration DESC;
SELECT attack_type, AVG(failed_logins) AS avg_failed_logins FROM cyber_attack_cleaned GROUP BY attack_type ORDER BY avg_failed_logins DESC;
SELECT attack_type, AVG(packet_count) AS avg_packet_count FROM cyber_attack_cleaned GROUP BY attack_type ORDER BY avg_packet_count DESC;
SELECT attack_type,AVG(src_bytes) AS avg_source_bytes, AVG(dst_bytes) AS avg_destination_bytes FROM cyber_attack_cleaned GROUP BY attack_type ORDER BY avg_source_bytes DESC;
SELECT attack_type, protocol, COUNT(*) AS record_count FROM cyber_attack_cleaned GROUP BY attack_type, protocol ORDER BY attack_type, record_count DESC;
SELECT COUNT(*) AS total_records, SUM(CASE WHEN attack_type <> 'Normal' THEN 1 ELSE 0 END) AS attack_records,ROUND(100.0 * SUM(CASE WHEN attack_type <> 'NORMAL' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attack_rate_percentage FROM cyber_attack_cleaned;
SELECT attack_type, AVG(duration) AS avg_duration, RANK() OVER (ORDER BY AVG(duration) DESC) AS duration_rank FROM cyber_attack_cleaned GROUP BY attack_type;
