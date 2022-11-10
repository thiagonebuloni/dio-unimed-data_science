from random import randint
from time import sleep


def intValidate(txt):
    '''
    function that validates integer numbers
    '''
    while True:
        try:
            n = int(input(txt))
        except (ValueError, TypeError):
            print('\033[;31mThe choice must be an integer number.\033[m')
        else:
            return n
            break


def user_interface(options):
    '''
    function presenting options and asking for player feedback
    returns integer.
    '''
    for index, option in enumerate(options):
        print(f'{index} = {option}')

    user_input = intValidate('What do you choose? ')
    while True:
        if user_input > 2:
            print('\033[;31mYou have to choose one of the choises above.\033[m')
            user_input = intValidate('What do you choose? ')
        else:
            break
    return user_input


def computer_choice(content):
    '''
    function that generates a random number based on the available options.
    returns random int
    '''
    computer_chose = randint(0, len(content)-1)
    return computer_chose


def check_results(choices, player, computer):
    '''
    function that checks who won.
    returns string
    '''
    if player == computer:
        return 'It\'s a tie'
    elif (player == 0 and computer == len(choices)-1) or (player > computer and not(player == len(choices)-1 and computer == 0)):
        return '\033[;32mPlayer Won\033[m'
    return '\033[;31mPlayer Lost\033[m'


def play():
    print('''
    ---------------------------------
    Welcome to Rock, Paper, Scissors.
    Please pick your weapon.
    ''')

    # define the options and ask contestants to pick one
    options_list = ['Rock', 'Paper', 'Scissors']
    player_result = user_interface(options_list)
    computer_result = computer_choice(options_list)

    # viusual representation in the terminal so we can see what both parties chose
    sleep(1)
    print(f'  player chose: {options_list[player_result]}')
    sleep(1)
    print(f'computer chose: {options_list[computer_result]}')

    # check the results between the two and print the winner.
    sleep(1)
    results = check_results(options_list, player_result, computer_result)
    print(f'\n{results}')


def main():

    # force the player into the play loop
    play_again = ''
    while play_again.lower() != 'n':
        play()
        print(f'Do you want to play again? ')

        while True:
            try:
                play_again = input('type \'y\' for yes or \'n\' for no: ')
                if play_again == 'y' or play_again == 'n':
                    break
                else:
                    print(
                        '\033[;31mYou have to choose between \'y\' or \'n\'\033[m')
            except:
                print()


main()
