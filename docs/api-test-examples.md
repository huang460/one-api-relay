# Test script for One API Relay

Run this to verify your relay is working:

```bash
curl https://your-ngrok-url.ngrok-free.dev/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your-token-here" \
  -d '{
    "model": "gpt-3.5-turbo",
    "messages": [{"role": "user", "content": "Hello, who are you?"}]
  }'
```

```python
# Python SDK usage
from openai import OpenAI

client = OpenAI(
    base_url="https://your-ngrok-url.ngrok-free.dev/v1",
    api_key="your-token-here"
)

response = client.chat.completions.create(
    model="gpt-3.5-turbo",
    messages=[{"role": "user", "content": "Hello"}]
)
print(response.choices[0].message.content)
```
