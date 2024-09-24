#!/bin/sh

scp -r "/Users/maddie/Documents/Code/NixFiles - Jet" jet.echo.clicks.domains:/home/maddie && ssh jet.echo.clicks.domains -t 'cd "NixFiles - Jet"; rm -rf .git; doas nixos-rebuild switch --flake .'
