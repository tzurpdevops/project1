response=$(curl -s http://localhost:5000)
echo 'test started...'
if [[ $response == "Hello Tzur" ]]; then
  exit 0 # success exit status
else
  exit 1 # failure exit status
fi


