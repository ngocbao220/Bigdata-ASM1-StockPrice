
# init_namenode.sh

echo "[INFO] Configuring HDFS..."
/entrypoint.sh

# Format HDFS 
if [ ! -d "/hadoop/dfs/name/current" ]; then
  echo "[INFO] Formatting HDFS for the first time..."
  hdfs namenode -format -force
fi
echo "[INFO] Starting NameNode daemon..."
hdfs namenode &

echo "[INFO] Waiting for NameNode to be ready..."
sleep 10

if [ -d "/upload_data" ]; then
  echo "[INFO] Uploading CSV files to HDFS:/data"
  hdfs dfs -mkdir -p /data
  hdfs dfs -put -f /upload_data/* /data/
  hdfs dfs -ls /data
else
  echo "[WARN] No /upload_data directory found"
fi


tail -f /dev/null
