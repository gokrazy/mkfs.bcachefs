package main

import "embed"

const bcachefsRoot = "third_party/bcachefs-tools-1.13.0/arm64"

//go:embed third_party/bcachefs-tools-1.13.0/arm64/*
var bcachefsEmbedded embed.FS
