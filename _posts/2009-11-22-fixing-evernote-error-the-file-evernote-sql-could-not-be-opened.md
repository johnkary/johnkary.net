---
layout: post
title: Fixing Evernote Error "The file Evernote.sql could not be opened."
tags: []
status: publish
type: post
published: true
meta:
  _edit_last: '1'
alias: /fixing-evernote-error-the-file-evernote-sql-could-not-be-opened
---
<img src="http://img.skitch.com/20091123-bcbwjxbayx95nhk8fpgk8epwe5.png" alt="Evernote error" width="500" />

I've been having a battery/power issue with my MacBook Pro recently where it will turn off if the battery power has much less than 0:10 minutes left. You know, after the "You are running on Reserve Power" message comes up, but before it fully drains and (normally) puts itself to sleep using [SafeSleep][].

So what do these power issues have to do with [Evernote][]?

I experienced at least one said power failure while working on a note from Evernote’s Mac Desktop client. From our days of using Windows, we all know power failures without proper shutdown lead to corrupted files on the hard drive. And that’s exactly what happened here: a corrupted notes database file.

After launching Evernote, I would get an error saying, `The file "Evernote.sql" could not be opened.` Assuming you have recently sync’d your notes so that everything is on the Evernote server, here’s how to fix it:

1.  Quit Evernote. Force quit if you have to.
2.  Open Terminal.
3.  Issue this command to remove your Evernote application settings and notes database directory:

        rm -rd ~/Library/Application Support/Evernote

4.  Launch Evernote. Your notes database and all settings will be downloaded from the Evernote server.

Easier fix than I anticipated. Here are the messages from my Console, in
case it helps you find this page via Google.


    11/22/09 10:10:20 PM Evernote[301] Client name: Evernote Mac/62233 (en-US); MacOS/10.5.8;

    11/22/09 10:10:21 PM Evernote[301] WebKit runtime: 531.21.8

    11/22/09 10:10:21 PM Evernote[301] WebCore runtime: 531.21.8

    11/22/09 10:10:21 PM Evernote[301] Safari clipper plugin version is 62229

    11/22/09 10:10:22 PM Evernote[301] NSInternalInconsistencyException thrown inside CoreData.

    11/22/09 10:10:22 PM Evernote[301] NSInternalInconsistencyException thrown inside CoreData.

    11/22/09 10:10:22 PM Evernote[301] NSInternalInconsistencyException thrown inside CoreData.

    11/22/09 10:10:22 PM Evernote[301] I/O error for database at /Users/johnkary/Library/Application Support/Evernote/data/51783/Evernote.sql.  SQLite error code:1, 'SQL logic error or missing database'

    11/22/09 10:10:22 PM Evernote[301] I/O error for database at /Users/johnkary/Library/Application Support/Evernote/data/51783/Evernote.sql.  SQLite error code:1, 'SQL logic error or missing database'

    11/22/09 10:10:22 PM Evernote[301] NSInternalInconsistencyException thrown inside CoreData.

    11/22/09 10:10:22 PM Evernote[301] NSInternalInconsistencyException thrown inside CoreData.

    11/22/09 10:10:22 PM Evernote[301] NSInternalInconsistencyException thrown inside CoreData.

    11/22/09 10:10:22 PM Evernote[301] Presenting error: Error Domain=NSCocoaErrorDomain Code=256 UserInfo=0x1543b310 "The file ?Evernote.sql? could not be opened."

    11/22/09 10:10:22 PM Evernote[301] Presenting error: Error Domain=NSCocoaErrorDomain Code=256 UserInfo=0x1543b310 "The file ?Evernote.sql? could not be opened."

    11/22/09 10:10:22 PM Evernote[301]   user info: {

    NSFilePath = "/Users/johnkary/Library/Application Support/Evernote/data/51783/Evernote.sql";

    NSLocalizedDescription = "The file \U201cEvernote.sql\U201d could not be opened.";

    NSStackTraceKey = "0x37419a  0x92289e3b  0x917a1f1a  0x917a45ab  0x9179d24c  0x91795d20  0x91795a27  0x91794aba  0x9179208b  0x962d8338  0x9617a6cb  0x962d7863  0x962d78e9  0x96406e5e  0x961edafc  0x9478d91d  0x9478d308  0x9478d3d8  0x939ae88e  0x9470e8f5  0x9470eaa8  0x9505f2ac  0x9505f0c5  0x9505ef39  0x95dd86d5  0x95dd7f88  0x95dd0f9f  0x95d9e1d8  0x2aea  0x2";

    NSUnderlyingError = Error Domain=NSCocoaErrorDomain Code=256 UserInfo=0x154dfbc0 "The file ?Evernote.sql? could not be opened.";

    NSUnderlyingException = I/O error for database at /Users/johnkary/Library/Application Support/Evernote/data/51783/Evernote.sql.  SQLite error code:1, 'SQL logic error or missing database';

    }

  [SafeSleep]: http://support.apple.com/kb/HT1757?viewlocale=en_US
  [Evernote]: http://www.evernote.com/