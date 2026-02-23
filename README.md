# Storage sorter program

[![Busted](https://github.com/Matteo-Penaud/cc-storage-system/actions/workflows/tests-ci.yml/badge.svg)](https://github.com/Matteo-Penaud/cc-storage-system/actions)

## Pre-Design
### Constrains
- The program must be independent and reusable in wider projects
- Storage inventories shall not be accessible by users (unless for maintenance)
- Unstorable items shall stay in the input inventory (eg. no more inventory available)
- A warning shall be raised if a inventory is almost full or full
- Storing one item time from user inventory to storage inventory shall take less than 1 second
- A watcher might be implemented and run once in a while (automatic or with user input) to check no different item types in inventories
- The program must wotk in a while loop or from user request (to avoid performance issues)

### Functional needs
- Store items automatically in inventorys from an input inventory
- Store a single item type per inventory
- Inventory name shall be item name
- The program must provide autocompletion for known items
- User shall request items using name and quantity
- User shall request items quantity using name

### Hardware
- One computer to manage all inventories
- One inventory per item type to store
- One inventory as input from user
- One inventory as output to user


# Design
## Data Structures
### Item 
- name
- count
- maxCount

### Inventory
- size
- items[size]
- peripheralName



## Inventory informations
- The inventory infos shall return the total amount of an item in the inventory
- The inventory infos shall return the populated slots
- The inventory infos shall return the first item in the inventory
- The inventory infos shall return the fisrt filled slot in an inventory

## Scanner
- The scanner needs to check all connected inventories with the following laws :
    - Inventories with one or more items in are labeled following the first item's name in the inventory (by index)
    - An inventory with different items shall be flagged as heterogenous
    - Empty inventories are labeled as empty
- The scanner shall then return the inventory/names associations and the empty list

## Sorter 
- The sorter has at least an input inventory for the user, and one destination inventory
- The sorter needs to move items from the input inventory to the item's dedicated inventory with the following laws :
    - All the items from an input slot are moved to the dedicated inventory at once
    - An unmovable item shall stay in the origin inventory.

## Grabber
- The grabber has at least one output inventory for the user, and one origin inventory
- The grabber shall move items from an origin inventory to the output with the following laws :
    - Requested items shall be present in an origin inventory
    - If the requested count might not be fulfilled, the grabber shall return the maximum items it can