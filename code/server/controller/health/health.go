package health

import "net/http"

func GetPing(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("pong"))
}
