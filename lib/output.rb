class Output
  def clear
    puts `clear`
  end

  def game_intro
    puts '
      ==========================================
      Welcome to BATTLESHIP: The Next Generation
      ==========================================

      What is your name?

    '
  end

  def welcome(name)
    puts "Hello Captain #{name}, I'm Commander Data.
      I'll be your guide during our battle with the Klingons"
  end

  def options
    puts 'Would you like to (p)lay, read the (i)instructions or (q)uit?'
  end

  def quit
    puts "Come back when you're ready to battle the Klingons"
  end

  def end_game
    puts 'Thanks for playing BATTLESHIP: The Next Generation'
  end

  def instructions_text
    clear

    puts "=====================================================================
      BATTLESHIP: The Next Generation is an intense test simulation for
      battling the Klingon threat. If you choose to (p)lay, the Klingons
      will automatically place their two-ship fleet on a 4x4 grid.
      One of their ships will hold two places on the 4x4 grid.
      The second ship will hold three places on the 4x4 grid.

      After the Klingons place their ships, you will be asked to place
      your ships on 4x4 grid. The grid corresponds to a letter and a number
      placement. For example, a1 will place the first spot of a ship in the
      top left corner of the 4x4 board.

      All ship placements must be placed horizontally or vertically on the
      board. If the placecment is invalid, the simulation will tell you to
      choose again. After all ships are placed, the battle will begin.

      Once the battle starts, you will asked to fire a proton torpedo at
      the Klingon's fleet. To do so, enter a valid coordinate on the 4x4
      grid. These coordinates will also conform to a a-d, 1-4 match.

      As you fire shots, the Klingons will as well. You'll see an updated
      battle map with your hits (H) or a miss (M).

      The battle is over when one of the fleets are destroyed.

      Good luck, Captain.
      ====================================================================="
  end
end
