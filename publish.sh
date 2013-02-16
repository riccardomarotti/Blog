if [ "$BLOG_SERVER_NAME" == "" ] || [ "$BLOG_FOLDER" == "" ]; then
    echo "
Devi definire le variabile BLOG_SERVER_NAME e BLOG_FOLDER.
"
    exit 0
fi

echo "Cerco le ultime modifiche..."
RSYNC_PARAMS='--exclude='${0##*/}' --exclude='.gitignore' --exclude='.git' --exclude='.DS_Store' -az --delete'
RSYNC_OUTPUT=$(rsync $RSYNC_PARAMS --dry-run --itemize-changes . $BLOG_SERVER_NAME:$BLOG_FOLDER)

if [ "$RSYNC_OUTPUT" == "" ]; then
    echo "Nessuna modifica."
    exit 0
fi

echo "$RSYNC_OUTPUT"
echo
echo "Vuoi pubblicare le modifiche? (s/N)"
read answer

if [ "$answer" == "s" ] || [ "$answer" == "S" ]; then
    echo "Pubblico le modifiche..."
    rsync $RSYNC_PARAMS . $BLOG_SERVER_NAME:$BLOG_FOLDER
    ssh $BLOG_SERVER_NAME 'cd blog; make html'
fi