# Storage sorter program

[![Busted](https://github.com/Matteo-Penaud/cc-storage-system/actions/workflows/tests-ci.yml/badge.svg)](https://github.com/Matteo-Penaud/cc-storage-system/actions)

## Pre-Design
### Constrains
- The program must be independent and reusable in wider projects
- Storage chests shall not be accessible by users (unless for maintenance)
- Unstorable items shall stay in the input chest (eg. no more chest available)
- A warning shall be raised if a chest is almost full or full
- Storing one item time from user chest to storage chest shall take less than 1 second
- A watcher might be implemented and run once in a while (automatic or with user input) to check no different item types in chests
- The program must wotk in a while loop or from user request (to avoid performance issues)

### Functional needs
- Store items automatically in chests from an input chest
- Store a single item type per chest
- Chest name shall be item name
- The program must provide autocompletion for known items
- User shall request items using name and quantity
- User shall request items quantity using name

### Hardware
- One computer to manage all chests
- One chest per item type to store
- One chest as input from user
- One chest as output to user

## Design
### Sorter
- The sorter program shall scan the network for chests and mark which item goes in the chest, or if the chest is empty
