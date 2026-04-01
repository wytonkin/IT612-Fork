@wytonkin ➜ .../IT612-Fork/it612/exercises/awk-practice (main) $ grep "POST" log
10.0.0.5 - - [01/Apr/2026:09:15:30] "POST /login" 401 215
10.0.0.5 - - [01/Apr/2026:09:16:05] "POST /login" 401 215
10.0.0.5 - - [01/Apr/2026:09:16:12] "POST /login" 200 512

@wytonkin ➜ .../IT612-Fork/it612/exercises/awk-practice (main) $ awk '{print $1, $6}' log
192.168.1.10 /index.html"
192.168.1.15 /api/users"
10.0.0.5 /login"
192.168.1.10 /dashboard"
10.0.0.5 /login"
10.0.0.5 /login"
192.168.1.15 /api/users"
192.168.1.20 /about"

@wytonkin ➜ .../IT612-Fork/it612/exercises/awk-practice (main) $ sed 's/10.0.0.5/REDACTED/g' log
192.168.1.10 - - [01/Apr/2026:09:15:22] "GET /index.html" 200 1024
192.168.1.15 - - [01/Apr/2026:09:15:25] "GET /api/users" 500 312
REDACTED - - [01/Apr/2026:09:15:30] "POST /login" 401 215
192.168.1.10 - - [01/Apr/2026:09:16:01] "GET /dashboard" 200 4096
REDACTED - - [01/Apr/2026:09:16:05] "POST /login" 401 215
REDACTED - - [01/Apr/2026:09:16:12] "POST /login" 200 512
192.168.1.15 - - [01/Apr/2026:09:17:00] "GET /api/users" 500 312
192.168.1.20 - - [01/Apr/2026:09:17:30] "GET /about" 404 128@wytonkin ➜ .../IT612-Fork/it612/exercises/awk-practice (main) $ 