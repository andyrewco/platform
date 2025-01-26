package app

import (
	"local/controller/auth"
	"local/controller/health"

	"github.com/go-chi/chi/middleware"
	"github.com/go-chi/chi/v5"
)

func NewRouter() chi.Router {
	r := chi.NewRouter()

	r.Use(middleware.Logger)

	// setup routes
	r.Route("/v1", func(r chi.Router) {
		// health routes
		r.Get("/healthping", health.GetPing)

		r.Route("/auth", func(r chi.Router) {
			r.Post("/login", auth.Login)
		})
	})

	return r
}
