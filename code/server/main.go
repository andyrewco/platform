package main

import (
	"fmt"
	"local/app"
	"log/slog"
	"net/http"
	"os"
)

func main() {
	port := 8080

	// setup logger
	logger := slog.New(slog.NewJSONHandler(os.Stdout, nil))

	r := app.NewRouter()

	logger.Info(fmt.Sprintf("Server running on port: %d", port))
	http.ListenAndServe(fmt.Sprintf(":%d", port), r)
}
