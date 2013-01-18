## Introduction

This applescript creates a compiled script (.scpt) in subfolder '/bin' (creates /bin if it does not exist) when a user right-clicks an .applescript file and selects the "Compile scpt" context menu item.

## Installation

1. Launch "Automator".
2. Choose/create a new "Service" workflow.
3. Choose "Service receives selected *files or folders* in *Finder*".
4. Search for and drag the "Run AppleScript" action into the workflow.
5. Cut and paste all the text from the "Make Project Folders" into the "Run Applescript" window replacing the default script text there.
6. Save the workflow and name it "Compile scpt".

## To edit the workflow or script

1. Open "System Preferences" -> "Keyboard Shortcuts".
2. Choose "Services".
3. Right-click "Compile scpt" and choose "Open in Automator".

## To delete the script

1. Open "System Preferences" -> "Keyboard Shortcuts".
2. Choose "Services".
3. Right-click "Compile scpt" and choose "Show in Finder".
4. Trash the "Compile scpt" workflow.
