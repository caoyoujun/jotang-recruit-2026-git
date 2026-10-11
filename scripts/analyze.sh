
if [ -z "$1" ]; then
    echo "Usage: $0 FILE"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    exit 1
fi

error_count=$(grep -c "ERROR" "$1")

top_code=$(grep "ERROR" "$1" | grep -o 'code=[0-9]*' | cut -d'=' -f2 | sort | uniq -c | sort -nr | head -n1 | awk '{print $2}')

echo "Total ERROR: $error_count"
echo "Top Code: $top_code"

exit 0
