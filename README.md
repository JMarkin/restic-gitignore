# Simple docker image for backup with restic without gitignore files

## USAGE

```sh
docker run --rm -it -e BACKUP_DIR=/projects -v ~/.config/rclone/rclone.conf:/rclone.conf -e RESTIC_PASSWORD=passwird -e RESTIC_REPOSITORY=rclone:foo:projects -v ~/projects:/projects jmarkin/restic-gitignore backup
```
