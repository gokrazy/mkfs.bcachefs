package main

import "embed"

const bcachefsRoot = "third_party/bcachefs-tools-1.13.0/amd64"

//go:embed third_party/bcachefs-tools-1.13.0/arm
var bcachefsEmbedded embed.FS
