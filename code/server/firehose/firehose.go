package firehose

import (
	"context"
	"log/slog"
	"net/http"
	"strings"

	"github.com/bluesky-social/indigo/api/atproto"
	"github.com/bluesky-social/indigo/events"
	"github.com/bluesky-social/indigo/events/schedulers/sequential"
	"github.com/gorilla/websocket"
)

func setupFirehose(logger *slog.Logger) {
	uri := "wss://bsky.network/xrpc/com.atproto.sync.subscribeRepos"
	con, _, err := websocket.DefaultDialer.Dial(uri, http.Header{})
	if err != nil {
		logger.Error(err.Error())
	}

	rsc := &events.RepoStreamCallbacks{
		RepoCommit: func(evt *atproto.SyncSubscribeRepos_Commit) error {
			for _, op := range evt.Ops {
				if !strings.Contains(op.Path, ".bsky.") &&
					!strings.Contains(op.Path, "sync.mastodon") {
					logger.Info(
						"",
						slog.String("repo", evt.Repo),
						slog.String("path", op.Path),
						slog.String("op", op.Action),
					)

				}
			}
			return nil
		},
	}

	sched := sequential.NewScheduler("myfirehose", rsc.EventHandler)
	events.HandleRepoStream(context.Background(), con, sched, logger)
}
