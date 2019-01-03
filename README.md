## Hangman

---

We all the know the popular game, Hangman. Well now its time to build the game as a command line application.

---

**Step 1**

Take 15 - 20 minutes and actually sketch out how the program will flow.

Things to consider:

- Will I need a loop to keep the game running?
- How will I keep track of the hidden word?
- Since I am on the command line and can't draw an actual man, how do I know when the player loses?
  - Why not just tell them how many guesses they have remaining?
- When a player guesses a letter, how will I check the hidden word to see if the guess is correct?

**Step 2**

The core mechanic of Hangman is to be able to check if a letter is included in a given word.

Before you start coding the application, use pry to figure out how to accomplish this.

**Step 3**

Once you are able to determine if a letter is in a word, you can start building the game.

When you begin, hardcode a single hidden word, rather than having an entire list of words like an actual Hangman game would use. Once you have the game logic working with a single word, you can expand to a list.

