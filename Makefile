TOMLS = $(wildcard **/*.toml)
FULL_VIDEOS = $(patsubst %.toml,src/%,$(TOMLS))

all: $(TOMLS)

src/%:
	./ffmpeg-toml --actions=download --full-video-dir=$(FULL_VIDEO_DIR) $*.toml

%.toml: src/%
	./ffmpeg-toml --actions=split --full-video-dir=$(FULL_VIDEO_DIR) --split-videos-dir=dst/$* $@

$(TOMLS): | $(FULL_VIDEOS)

.PHONY: all
