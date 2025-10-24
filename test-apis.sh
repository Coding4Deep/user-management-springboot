#!/bin/bash

echo "=== User Management Application API Tests ==="
echo

BASE_URL="http://localhost:8080"

echo "1. Testing Home Page (should redirect to login)..."
curl -s -o /dev/null -w "Status: %{http_code}\n" $BASE_URL/
echo

echo "2. Testing Login Page..."
curl -s -o /dev/null -w "Status: %{http_code}\n" $BASE_URL/login
echo

echo "3. Testing Registration Page..."
curl -s -o /dev/null -w "Status: %{http_code}\n" $BASE_URL/register
echo

echo "4. Testing User Registration..."
REGISTER_RESPONSE=$(curl -s -w "Status: %{http_code}" -X POST $BASE_URL/register \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "username=apitest&email=apitest@example.com&password=password123")
echo "Registration: $REGISTER_RESPONSE"
echo

echo "5. Testing Dashboard Access (should redirect to login)..."
curl -s -o /dev/null -w "Status: %{http_code}\n" $BASE_URL/dashboard
echo

echo "6. Testing H2 Console Access..."
curl -s -o /dev/null -w "Status: %{http_code}\n" $BASE_URL/h2-console
echo

echo "7. Testing Non-existent Endpoint (should return 404)..."
curl -s -o /dev/null -w "Status: %{http_code}\n" $BASE_URL/nonexistent
echo

echo "=== API Tests Complete ==="
echo
echo "Expected Results:"
echo "- Home page: 302 (redirect to login)"
echo "- Login page: 200 (success)"
echo "- Registration page: 200 (success)"
echo "- User registration: 302 (redirect after successful registration)"
echo "- Dashboard: 302 (redirect to login - authentication required)"
echo "- H2 Console: 302 (redirect to H2 console login)"
echo "- Non-existent endpoint(ERROR): 404 (not found)"
