module github.com/procoder17/goproxy-spoof-tls-ja3

go 1.21

toolchain go1.22.7

require (
	github.com/Danny-Dasilva/fhttp v0.0.0-20240217042913-eeeb0b347ce1
	github.com/procoder17/CycleTLSForGoProxy/cycletls v0.0.0-20241014143329-713e3ed2fc1f
	github.com/procoder17/goproxy-spoof-tls-ja3/ext v0.0.0-20241014163659-89d1fa57111c
	golang.org/x/net v0.26.0
)

require (
	github.com/andybalholm/brotli v1.1.0 // indirect
	github.com/cloudflare/circl v1.3.7 // indirect
	github.com/gorilla/websocket v1.5.1 // indirect
	github.com/klauspost/compress v1.17.6 // indirect
	github.com/quic-go/quic-go v0.41.0 // indirect
	github.com/refraction-networking/utls v1.6.2 // indirect
	golang.org/x/crypto v0.24.0 // indirect
	golang.org/x/sys v0.21.0 // indirect
	golang.org/x/text v0.16.0 // indirect
	h12.io/socks v1.0.3 // indirect
)

replace github.com/procoder17/goproxy-spoof-tls-ja3/ext => ./ext
