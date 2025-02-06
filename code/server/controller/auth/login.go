package auth

import (
	"net/http"

	"github.com/bluesky-social/indigo/util/cliutil"
	"github.com/bluesky-social/indigo/xrpc"
)

type LoginBody struct {
	Msg string
}

func Login(w http.ResponseWriter, r *http.Request) {
	handle := "ancgames.com"
	host := "https://bsky.social"

	_ = &xrpc.Client{
		Client: cliutil.NewHttpClient(),
		Host:   host,
		Auth:   &xrpc.AuthInfo{Handle: handle},
	}

	// Set the status code to 301 Moved Permanently
	w.WriteHeader(http.StatusMovedPermanently)

	// Set the Location header to the new URL
	newURL := "https://google.com/"
	w.Header().Add("Content-Type", "application/json")
	w.Header().Set("Location", newURL)
}
