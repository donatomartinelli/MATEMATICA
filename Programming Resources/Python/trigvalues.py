import pandas as pd
import random

# Create the DataFrame
data = {
    'α°': [0, 30, 45, 60, 90, 120, 135, 150, 180, 210, 225, 240, 270, 300, 315, 330],
    'α': ['0', 'π/6', 'π/4', 'π/3', 'π/2', '2π/3', '3π/4', '5π/6', 'π', '7π/6', '5π/4', '4π/3', '3π/2', '5π/3', '7π/4', '11π/6'],
    'cos(α)': [1, '√3/2', '√2/2', '1/2', 0, '-1/2', '-√2/2', '-√3/2', -1, '-√3/2', '-√2/2', '-1/2', 0, '1/2', '√2/2', '√3/2'],
    'sin(α)': [0, '1/2', '√2/2', '√3/2', 1, '√3/2', '√2/2', '1/2', 0, '-1/2', '-√2/2', '-√3/2', -1, '-√3/2', '-√2/2', '-1/2'],
    'tan(α)': [0, '√3/3', 1, '√3', '∞', '-√3', -1, '-√3/3', 0, '√3/3', 1, '√3', '∞', '-√3', -1, '-√3/3'],
    'cot(α)': ['∞', '√3', 1, '√3/3', 0, '-√3/3', -1, '-√3', '∞', '√3', 1, '√3/3', 0, '-√3/3', -1, '-√3'],
    'sec(α)': [1, '2√3/3', '√2', 2, '∞', -2, '-√2', '-2√3/3', -1, '-2√3/3', '-√2', -2, '∞', 2, '√2', '2√3/3'],
    'csc(α)': ['∞', 2, '√2', '2√3/3', 1, '2√3/3', '√2', 2, '∞', -2, '-√2', '-2√3/3', -1, '-2√3/3', '-√2', -2]
}

df = pd.DataFrame(data)

# Randomly select an angle and a function
angle = random.choice(data['α'])
function = random.choice(['cos', 'sin', 'tan', 'cot', 'sec', 'csc'])

# Wait for specific input to reveal the answer
print(f"Calculate the {function} of {angle}")
input("Press a random letter and enter to reveal the answer: ")

# Find the row for the given angle
row = df[df['α'] == angle]

if not row.empty:
    answer = row.iloc[0][f'{function}(α)']
    print(f'The {function} of {angle} is {answer}')
else:
    print(f'Angle {angle} not found in the table.')
