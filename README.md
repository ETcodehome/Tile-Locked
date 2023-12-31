### TODO:

- [X] Add a way to gain tiles
    - [X] Per x experience gained
        - [X] Charge the XP to unlock the tiles
    - [X] Per x levels gained
        - [X] Charge the level to unlock the tiles (levels cost more xp at higher levels)
- [X] Handle Nether/End travel if no available tiles
    - Automatically unlock 1 tile if no nearby tiles
- [ ] Only use a tile if you are touching the ground?
    - Or using a boat
- [X] What happens when you die and respawn in a bed with no available tiles and no unlocked tiles by the bed
    - Move player to closest tile if more than 1 block distance from last tile?
- [ ] Tile overlays
    - [X] Show on top of all blocks that have non full blocks above them?
        - [X] remove when block is broken
        - [X] add when new block placed
        - [ ] only check y level based on dimension
- [ ] Customisations
    - [ ] Choose a tile color (maybe)
    - [ ] Choose a difficulty
        - [X] Easy
            - 1 xp per tile
        - [X] Medium
            - 5 xp per tile
        - [X] Hard
            - 1 level per tile