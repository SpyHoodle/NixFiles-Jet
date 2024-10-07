#!/bin/sh

scp -r "/Users/maddie/Documents/Code/server" jet.echo.clicks.domains:/home/maddie && ssh jet.echo.clicks.domains -t 'cd "server"; rm -rf .git; doas nixos-rebuild switch --flake .'
