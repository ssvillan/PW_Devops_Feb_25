until [[ -f "/tmp/file.txt" ]]; do
    echo "Waiting for File..."
    sleep 5
done
