package auth

import (
	"net/http"

	"github.com/bluesky-social/indigo/util/cliutil"
	"github.com/bluesky-social/indigo/xrpc"
)

func Login(w http.ResponseWriter, r *http.Request) {
	handle := "ancgames.com"
	host := "https://bsky.social"

	_ = &xrpc.Client{
		Client: cliutil.NewHttpClient(),
		Host:   host,
		Auth:   &xrpc.AuthInfo{Handle: handle},
	}

	w.Write([]byte("login"))
}
