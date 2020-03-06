# Workshop

This is intended as a support material for Coaches to teach workshops that introduce Elixir to people that already knows some programming. 

Nevertheless, feel free to use it for self study.

This was inspired by the workshop [Rob Martin - Fun with Elixir, Automata, and Zombies](https://www.lambdadays.org/lambdadays2020#workshops) held in Lambda Days.

## Preparation

- [Install](https://elixir-lang.org/install.html) Elixir
- [Install](https://code.visualstudio.com/Download) VSCode
  - Optionally [install](https://marketplace.visualstudio.com/items?itemName=elixir-lsp.elixir-ls) ElixirLS plugin

## Game of Life

The [Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) is a
zero-player game, which means that it requires no player interacting with it.

The original setup consists of an infinite, 2-dimensional grid of cells, 
and each cell can be `alive` or `dead`. At each step of time (`tick`),
the following rules apply to decide what happens with each cell.

## Rules
1.  Any live cell with fewer than two live neighbours dies, as if by
underpopulation.
2.  Any live cell with two or three live neighbours lives on to the next
generation.
3.  Any live cell with more than three live neighbours dies, as if by
overpopulation.
4.  Any dead cell with exactly three live neighbours becomes a live cell, as if
by reproduction.

## Example
![game of life example](https://upload.wikimedia.org/wikipedia/commons/e/e5/Gospers_glider_gun.gif)

# Elixir
Elixir is a dynamic, functional language designed for building scalable and maintainable applications.

Elixir leverages the Erlang VM, known for running low-latency, distributed and fault-tolerant systems, while also being successfully used in web development and the embedded software domain.

- [Cheatsheet](https://devhints.io/elixir)
- [Getting started](https://elixir-lang.org/getting-started/basic-types.html)

# Let's start coding
We can start by cloning this repository into our own machines.
```sh
git clone https://github.com/ggpasqualino/workshop-elixir-game-of-life game-of-life
cd game-of-life
```

This repository already contains an skeleton [test file](test/features/game_of_life_test.exs)
defined, which we can run with the following command.
```sh
mix test
```

And this reveals that we have 4 tests defined, from which 3 are skipped and
1 is failing.
```sh
  1) test Any live cell with fewer than two live neighbours dies, as if by underpopulation. (Features.GameOfLifeTest)
     test/features/game_of_life_test.exs:5
     ** (UndefinedFunctionError) function GameOfLife.new/0 is undefined or private
     code: current_generation = GameOfLife.new()
     stacktrace:
       (game_of_life) GameOfLife.new()
       test/features/game_of_life_test.exs:6: (test)



Finished in 0.06 seconds
4 tests, 1 failure, 3 skipped
```

Now, let's open this repository in our favorite code editor and start coding!

Let's start together, then we will continue in small groups of 2 to 3 people.

![moments later](https://media.giphy.com/media/xUPJPnaANa5SFyTlTi/giphy.gif)

Now that we can create new generations of the game based on the current one, let's render it to the termnal using the module [GameRenderer](lib/game_renderer.ex) within this repository.

![](docs/rendered-game.png)

That looks cool!
To close, let's make the game play itself usinng a [GenServer](game_server.ex) we have defined.

## Extra Topics
Supervision trees - what happens when our `GameServer` crashes?
