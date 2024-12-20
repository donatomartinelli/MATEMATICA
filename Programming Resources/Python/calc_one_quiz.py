import random
from IPython.display import display, Math

limits = {
    r"\lim_{{x \to 0}} \dfrac{{\ln(1+x)}}{x}" : r"1",
    r"\lim_{{f(x) \to 0}} \dfrac{{\ln(1+f(x))}}{f(x)}" : r"1",
    r"\lim_{{x \to 0}} \dfrac{x}{\ln(1+x)}" : r"1",
    r"\lim_{{f(x) \to 0}} \dfrac{f(x)}{\ln(1+f(x))}" : r"1",
    r"\lim_{{x \to 0}} \dfrac{{\ln(1+nx)}}{mx}" : r"\dfrac{n}{m}",
    r"\lim_{{f(x) \to 0}} \dfrac{{\ln(1+nf(x))}}{mf(x)}" : r"\dfrac{n}{m}",
    r"\lim_{{x \to 0}} \dfrac{mx}{\ln(1+nx)}" : r"\dfrac{m}{n}",
    r"\lim_{{f(x) \to 0}} \dfrac{mf(x)}{\ln(1+nf(x))}" : r"\dfrac{m}{n}",
    r"\lim_{{x \to 0}} \dfrac{{\ln(1+ax)}}{\ln(1+bx)}" : r"\dfrac{a}{b}",
    r"\lim_{{x \to 0}} \dfrac{{\ln x - \ln a}}{x-a}" : r"\dfrac{1}{a}",
    r"\lim_{{f(x) \to 0}} \dfrac{{\ln f(x) - \ln a}}{f(x) - a}" : r"\dfrac{1}{a}",
    r"\lim_{{x \to 0}} \dfrac{{x-a}}{\ln x - \ln a}" : r"a",
    r"\lim_{{f(x) \to 0}} \dfrac{{f(x) - a}}{\ln f(x) - \ln a}" : r"a",

    r"\lim_{{x \to 0}} \dfrac{{\log_a(1+x)}}{x}" : r"\dfrac{1}{\ln(a)}",
    r"\lim_{{f(x) \to 0}} \dfrac{{\log_a(1+f(x))}}{f(x)}" : r"\dfrac{1}{\ln(a)}",
    r"\lim_{{x \to 0}} \dfrac{x}{\log_a(1+x)}" : r"\ln(a)",
    r"\lim_{{f(x) \to 0}} \dfrac{f(x)}{\log_a(1+f(x))}" : r"\ln(a)",

    r"\lim_{{x \to 1}} \dfrac{{x^\alpha - 1}}{x-1}" : r"\alpha",
    r"\lim_{{x \to +\infty}} \dfrac{{x^n + a}}{{x^n}}^{bx^n}" : r"ab",

    r"\lim_{{x \to 0}} \dfrac{{e^x - 1}}{x}" : r"1",
    r"\lim_{{f(x) \to 0}} \dfrac{{e^{f(x)} - 1}}{f(x)}" : r"1",
    r"\lim_{{x \to 0}} \dfrac{x}{e^x - 1}" : r"1",
    r"\lim_{{f(x) \to 0}} \dfrac{f(x)}{e^{f(x)} - 1}" : r"1",
    r"\lim_{{x \to 0}} \dfrac{{e^{ax} - 1}}{bx}" : r"\dfrac{a}{b}",
    r"\lim_{{f(x) \to 0}} \dfrac{{e^{af(x)} - 1}}{bf(x)}" : r"\dfrac{a}{b}",
    r"\lim_{{x \to 0}} \dfrac{bx}{e^{ax} - 1}" : r"\dfrac{b}{a}",
    r"\lim_{{f(x) \to 0}} \dfrac{bf(x)}{e^{af(x)} - 1}" : r"\dfrac{b}{a}",

    r"\lim_{{x \to 0}} \dfrac{{a^x - 1}}{x}" : r"\ln(a)",
    r"\lim_{{f(x) \to 0}} \dfrac{{a^{f(x)} - 1}}{f(x)}" : r"\ln(a)",
    r"\lim_{{x \to 0}} \dfrac{x}{a^x - 1}" : r"\dfrac{1}{\ln(a)}",
    r"\lim_{{f(x) \to 0}} \dfrac{f(x)}{a^{f(x)} - 1}" : r"\dfrac{1}{\ln(a)}",
    r"\lim_{{x \to 0}} \dfrac{{a^{mx} - 1}}{nx}" : r"\dfrac{m \ln(a)}{n}",
    r"\lim_{{f(x) \to 0}} \dfrac{{a^{mf(x)} - 1}}{nf(x)}" : r"\dfrac{m \ln(a)}{n}",
    r"\lim_{{x \to 0}} \dfrac{nx}{a^{mx} - 1} " : r"\dfrac{n}{m \ln(a)}",
    r"\lim_{{f(x) \to 0}} \dfrac{nf(x)}{a^{mf(x)} - 1}" : r"\dfrac{n}{m \ln(a)}",
    r"\lim_{{x \to 0}} \dfrac{{a^x - 1}}{x-1}" : r"a^x \ln(a)",

    r"\lim_{{x \to \infty}} \left(1 + \dfrac{1}{x}\right)^x" : r"e",
    r"\lim_{{f(x) \to \infty}} \left(1 + \dfrac{1}{f(x)}\right)^{f(x)}" : r"e",
    r"\lim_{{x \to \infty}} \left(1 + \dfrac{k}{x}\right)^{nx}" : r"e^{kn}",
    r"\lim_{{x \to a}} \dfrac{{e^x - e^a}}{x-a}" : r"e^a",
    r"\lim_{{x \to \infty}} (1 + x)^{\dfrac{1}{x}}" : r"e",
    r"\lim_{{x \to \infty}} (1 + cx^n)^{\dfrac{k}{cx^n}}" : r"e^{kc}",

    r"\lim_{{x \to 0}} \dfrac{{(1+x)^c - 1}}{x}" : r"c",
    r"\lim_{{f(x) \to 0}} \dfrac{{(1+f(x))^c - 1}}{f(x)}" : r"c",

    r"\lim_{{x \to 0}} \dfrac{{\sin x}}{x}" : r"1",
    r"\lim_{{f(x) \to 0}} \dfrac{{\sin f(x)}}{f(x)}" : r"1",
    r"\lim_{{x \to 0}} \dfrac{{\sin^n x}}{\sin x^n}" : r"1",
    r"\lim_{{f(x) \to 0}} \dfrac{{\sin^n f(x)}}{\sin f^n(x)}" : r"1",
    r"\lim_{{x \to 0}} \dfrac{{\sin x^n}}{\sin^n x}" : r"1",
    r"\lim_{{f(x) \to 0}} \dfrac{{\sin f^n(x)}}{\sin^n f(x)}" : r"1",
    r"\lim_{{x \to 0}} \dfrac{mx}{\sin nx}" : r"\dfrac{m}{n}",
    r"\lim_{{x \to 0}} \dfrac{{\sin nx}}{mx}" : r"\dfrac{n}{m}",

    r"\lim_{{x \to 0}} \dfrac{{1 - \cos x}}{x^2}" : r"\dfrac{1}{2}",
    r"\lim_{{f(x) \to 0}} \dfrac{{1 - \cos f(x)}}{f^2(x)}" : r"\dfrac{1}{2}",
    r"\lim_{{x \to 0}} \dfrac{{1 - \cos x}}{x}" : r"0",
    r"\lim_{{f(x) \to 0}} \dfrac{{1 - \cos f(x)}}{f(x)}" : r"0",

    r"\lim_{{x \to 0}} \dfrac{{\tan x}}{x}" : r"1",
    r"\lim_{{f(x) \to 0}} \dfrac{{\tan f(x)}}{f(x)}" : r"1",
    r"\lim_{{x \to 0}} \dfrac{{\tan^n x}}{\tan x^n}" : r"1",
    r"\lim_{{f(x) \to 0}} \dfrac{{\tan^n f(x)}}{\tan f^n(x)}" : r"1",
    r"\lim_{{x \to 0}} \dfrac{{\tan x^n}}{\tan^n x}" : r"1",
    r"\lim_{{f(x) \to 0}} \dfrac{{\tan f^n(x)}}{\tan^n f(x)}" : r"1",

    r"\lim_{{x \to 0}} \dfrac{{\arcsin x}}{x}" : r"1",
    r"\lim_{{f(x) \to 0}} \dfrac{{\arcsin f(x)}}{f(x)}" : r"1",
    r"\lim_{{x \to 0}} \dfrac{x}{\arcsin x}" : r"1",
    r"\lim_{{f(x) \to 0}} \dfrac{f(x)}{\arcsin f(x)}" : r"1",
    r"\lim_{{x \to 0}} \dfrac{{\arcsin ax}}{\arcsin bx}" : r"\dfrac{a}{b}",
    r"\lim_{{x \to 0}} \dfrac{{\arccos(1-ax)}}{\arccos(1-bx)}" : r"dfrac{a}{b}",
    r"\lim_{{x \to 0}} \dfrac{{\arctan ax}}{\arctan bx}" : r"\dfrac{a}{b}"
}

derivatives = {
    r"\dfrac{d}{d x}\,k": r"0",
    r"\dfrac{d}{d x}\,x^a": r"ax^{a-1},\quad a\in\mathbb{R}",
    r"\dfrac{d}{d x}\,x": r"1",
    r"\dfrac{d}{d x}\,\sqrt{x}": r"\dfrac{1}{2\sqrt{x}},\quad x>0",
    r"\dfrac{d}{d x}\,\sqrt[n]{x}": r"\dfrac{1}{n\sqrt[n]{x^{n-1}}},\quad x>0,\; n\in\mathbb{N}",
    r"\dfrac{d}{d x}\,\dfrac{1}{x}": r"-\frac{1}{x^2}",

    r"\dfrac{d}{d x}\,a^x": r"a^x\ln a,\quad a>0",
    r"\dfrac{d}{d x}\,e^x": r"e^x",
    r"\dfrac{d}{d x}\,\log_a x": r"\dfrac{\log_a e}{x},\quad x>0",
    r"\dfrac{d}{d x}\,\ln x": r"\dfrac{1}{x},\quad x>0",

    r"\dfrac{d}{d x}\,\sin x": r"\cos x",
    r"\dfrac{d}{d x}\,\cos x": r"-\sin x",
    r"\dfrac{d}{d x}\,\tan x": r"\dfrac{1}{\cos^2 x}=1+\tan^2 x",
    r"\dfrac{d}{d x}\,\cot x": r"-\dfrac{1}{\sin^2 x}=-(1+\cot^2 x)",

    r"\dfrac{d}{d x}\,\arctan x": r"\dfrac{1}{1+x^2}",
    r"\dfrac{d}{d x}\,\textup{arccot }x": r"-\dfrac{1}{1+x^2}",
    r"\dfrac{d}{d x}\,\arcsin x": r"\dfrac{1}{\sqrt{1-x^2}}",
    r"\dfrac{d}{d x}\,\arccos x": r"-\dfrac{1}{\sqrt{1-x^2}}",

    r"\dfrac{d}{d x}\,[k\cdot f(x)]": r"k\cdot f'(x)",
    r"\dfrac{d}{d x}\,[f(x)+g(x)]": r"f'(x)+g'(x)",
    r"\dfrac{d}{d x}\,[f(x)\cdot g(x)]": r"f'(x)\cdot g(x)+f(x)\cdot g'(x)",
    r"\dfrac{d}{d x}\,[f(x)\cdot g(x)\cdot z(x)]": r"f'(x)\cdot g(x)\cdot z(x)+f(x)\cdot g'(x)\cdot z(x)+f(x)\cdot g(x)\cdot z'(x)",
    r"\dfrac{d}{d x}\,[f(x)]^a": r"a[f(x)]^{a-1}\cdot f'(x),\quad a\in\mathbb{R}",
    r"\dfrac{d}{d x}\,\left[\dfrac{1}{f(x)}\right]": r"-\dfrac{f'(x)}{f^2(x)}",
    r"\dfrac{d}{d x}\,\left[\dfrac{f(x)}{g(x)}\right]": r"\dfrac{f'(x)\cdot g(x)-f(x)\cdot g'(x)}{g^2(x)}",
    r"\dfrac{d}{d x}\,[f(g(x))]": r"f'(z)\cdot g'(x),\quad z=g(x)",
    r"\dfrac{d}{d x}\,[f(g(z(x)))]": r"f'(u)\cdot g'(t)\cdot z'(x),\quad t=z(x),\; u=g(t)",
    r"\dfrac{d}{d x}\,[f(x)]^{g(x)}": r"[f(x)]^{g(x)}\left[g'(x)\ln f(x)+\dfrac{g(x)\cdot f'(x)}{f(x)}\right]",
    r"\dfrac{d}{d x}\,[f^{-1}(y)]": r"\dfrac{1}{f'(x)},\quad x=f^{-1}(y)",
}

integrals = {
    r"\int \, dx" : r"x + c",
    r"\int x^p \, dx" : r"\frac{x^{p+1}}{p+1} + c \quad \forall p \in \mathbb{R} \setminus \{-1\}",
    r"\int \frac{1}{x} \, dx" : r"\ln|x| + c",
    r"\int \sqrt{x} \, dx" : r"\frac{2}{3}\sqrt{x^3} + c",
    
    r"\int e^x \, dx" : r"e^x + c",
    r"\int a^x \, dx" : r"\frac{a^x}{\ln a} + c \quad \forall a \in \mathbb{R} \setminus \{1\}",
    
    r"\int \sin(x) \, dx" : r"-\cos(x) + c",
    r"\int \cos(x) \, dx" : r"\sin(x) + c",
    r"\int \tan(x) \, dx" : r"-\ln|\cos(x)| + c",
    r"\int \cot(x) \, dx" : r"\ln|\sin(x)| + c",
    r"\int \frac{1}{\cos^2(x)} \, dx" : r"\tan(x) + c",
    r"\int \frac{1}{\sin^2(x)} \, dx" : r"-\cot(x) + c",
    
    r"\int \frac{1}{1+x^2} \, dx" : r"\arctan(x) + c = -\textup{arccot}(x) + c",
    r"\int \frac{1}{\sqrt{1-x^2}} \, dx" : r"\arcsin(x) + c = -\arccos(x) + c",
    
    r"\int \frac{1}{\sqrt{a^2 - x^2}} \, dx" : r"\arcsin\frac{x}{|a|} + c",
    r"\int \frac{1}{a^2 + x^2} \, dx" : r"\frac{1}{a}\arctan\frac{x}{a} + c",
    r"\int \frac{x}{\sqrt{x^2 + a}} \, dx" : r"\sqrt{x^2 + a} + c",
    r"\int \frac{x}{\sqrt{a - x^2}} \, dx" : r"-\sqrt{a - x^2} + c",
    r"\int \frac{1}{a^2 - x^2} \, dx" : r"\frac{1}{2a}\ln\left|\frac{a+x}{a-x}\right| + c",
    r"\int \frac{1}{x^2 - a^2} \, dx" : r"\frac{1}{2a}\ln\left|\frac{x-a}{x+a}\right| + c",
    r"\int \frac{1}{\sqrt{x^2 \pm a^2}} \, dx" : r"\ln|x + \sqrt{x^2 \pm a^2}| + c",
    r"\int \frac{1}{\sin(x)} \, dx" : r"\ln\left|\tan\frac{x}{2}\right| + c",
    r"\int \frac{1}{\cos(x)} \, dx" : r"\ln\left|\tan\left(\frac{x}{2} + \frac{\pi}{4}\right)\right| + c",
    
    r"\int \sin^2(x) \, dx" : r"\frac{1}{2}(x - \sin(x)\cos(x)) + c",
    r"\int \cos^2(x) \, dx" : r"\frac{1}{2}(x + \sin(x)\cos(x)) + c",
    r"\int \sqrt{a^2 - x^2} \, dx" : r"\frac{1}{2}(a^2 \arcsin\frac{x}{a} + x\sqrt{a^2 - x^2}) + c",

    r"\int f'(x)\cos f(x) \,dx": r"\sin f(x) + c",
    r"\int f'(x)\sin f(x) \,dx": r"-\cos f(x) + c",
    r"\int \dfrac{f'(x)}{\cos^2f(x)} \,dx": r"\tan f(x) + c",
    r"\int \dfrac{f'(x)}{\sin^2f(x)} \,dx": r"-\cot f(x) + c",
    
    r"\int\dfrac{f'(x)}{1+[f(x)]^2} \, dx": r"\begin{cases} \arctan f(x)+c \\ -\textup{arccot} f(x)+c \end{cases}",
    r"\int\dfrac{f'(x)}{\sqrt{1-[f(x)]^2}} \, dx": r"\begin{cases} \arcsin f(x)+c \\ -\arccos f(x)+c \end{cases}",
    
    r"\int f^\alpha(x)f'(x) \,dx": r"\dfrac{f^{\alpha+1}}{\alpha+1} + c \quad \forall\,\alpha\in\mathbb{R}\setminus\{1\}",
    
    r"\int \dfrac{f'(x)}{f(x)} \,dx": r"\ln|f(x)| + c",
    r"\int e^{f(x)}f'(x) \,dx": r"e^{f(x)} + c",
    r"\int a^{f(x)}f'(x) \,dx": r"\dfrac{a^{f(x)}}{\ln a} + c",
    
    r"\int \dfrac{f'(x)}{\sqrt{a^2-[f(x)]^2}} \,dx": r"\arcsin\dfrac{f(x)}{|a|} + c,\;a\neq0",
    r"\int \dfrac{f'(x)}{a^2+[f(x)]^2} \,dx": r"\dfrac{1}{a}\arctan\dfrac{f(x)}{a} + c,\;a\neq0"
}

associated_arcs = {
    r"\sin\left(\dfrac{\pi}{2}-\alpha\right)": r"\cos\alpha",
    r"\cos\left(\dfrac{\pi}{2}-\alpha\right)": r"\sin\alpha",
    r"\tan\left(\dfrac{\pi}{2}-\alpha\right)": r"\cot\alpha",
    r"\cot\left(\dfrac{\pi}{2}-\alpha\right)": r"\tan\alpha",

    r"\sin\left(\dfrac{\pi}{2}+\alpha\right)": r"\cos\alpha",
    r"\cos\left(\dfrac{\pi}{2}+\alpha\right)": r"-\sin\alpha",
    r"\tan\left(\dfrac{\pi}{2}+\alpha\right)": r"-\cot\alpha",
    r"\cot\left(\dfrac{\pi}{2}+\alpha\right)": r"-\tan\alpha",

    r"\sin\left(\pi-\alpha\right)": r"\sin\alpha",
    r"\cos\left(\pi-\alpha\right)": r"-\cos\alpha",
    r"\tan\left(\pi-\alpha\right)": r"-\tan\alpha",
    r"\cot\left(\pi-\alpha\right)": r"-\cot\alpha",

    r"\sin\left(\pi+\alpha\right)": r"-\sin\alpha",
    r"\cos\left(\pi+\alpha\right)": r"-\cos\alpha",
    r"\tan\left(\pi+\alpha\right)": r"\tan\alpha",
    r"\cot\left(\pi+\alpha\right)": r"\cot\alpha",

    r"\sin\left(\dfrac{3\pi}{2}-\alpha\right)": r"-\cos\alpha",
    r"\cos\left(\dfrac{3\pi}{2}-\alpha\right)": r"-\sin\alpha",
    r"\tan\left(\dfrac{3\pi}{2}-\alpha\right)": r"\cot\alpha",
    r"\cot\left(\dfrac{3\pi}{2}-\alpha\right)": r"\tan\alpha",

    r"\sin\left(\dfrac{3\pi}{2}+\alpha\right)": r"-\cos\alpha",
    r"\cos\left(\dfrac{3\pi}{2}+\alpha\right)": r"\sin\alpha",
    r"\tan\left(\dfrac{3\pi}{2}+\alpha\right)": r"-\cot\alpha",
    r"\cot\left(\dfrac{3\pi}{2}+\alpha\right)": r"-\tan\alpha",

    r"\sin\left(-\alpha\right)": r"-\sin\alpha",
    r"\cos\left(-\alpha\right)": r"\cos\alpha",
    r"\tan\left(-\alpha\right)": r"-\tan\alpha",
    r"\cot\left(-\alpha\right)": r"-\cot\alpha",
}

goniometric_formulas = {
    r"\sin(\alpha\pm\beta)": r"\sin(\alpha)\cos(\beta)\pm\sin(\beta)\cos(\alpha)",
    r"\cos(\alpha\pm\beta)": r"\cos(\alpha)\cos(\beta)\mp\sin(\alpha)\sin(\beta)",
    r"\tan(\alpha\pm\beta)": r"\dfrac{\tan(\alpha)\pm\tan(\beta)}{1\mp\tan(\alpha)\tan(\beta)}",
    r"\cot(\alpha\pm\beta)": r"\dfrac{\cot(\alpha)\cot(\beta)\mp1}{\cot(\beta)\pm\cot(\alpha)}",

    r"\sin(2\alpha)": r"2\sin(\alpha)\cos(\alpha)",
    r"\cos(2\alpha)": r"\cos^2(\alpha)-\sin^2(\alpha)",
    r"\tan(2\alpha)": r"\dfrac{2\tan(\alpha)}{1-\tan^2(\alpha)}",
    r"\cot(2\alpha)": r"\dfrac{\cot^2\alpha-1}{2\cot(\alpha)}",

    r"\sin\left(\dfrac{\alpha}{2}\right)": r"\pm\sqrt{\dfrac{1-\cos(\alpha)}{2}}",
    r"\cos\left(\dfrac{\alpha}{2}\right)": r"\pm\sqrt{\dfrac{1+\cos(\alpha)}{2}}",
    r"\tan\left(\dfrac{\alpha}{2}\right)": r"\pm\sqrt{\dfrac{1-\cos(\alpha)}{1+\cos(\alpha)}}=\dfrac{\sin(\alpha)}{1+\cos(\alpha)}=\dfrac{1-\cos(\alpha)}{\sin(\alpha)}",
    r"\cot\left(\dfrac{\alpha}{2}\right)": r"\pm\sqrt{\dfrac{1+\cos(\alpha)}{1-\cos(\alpha)}}=\dfrac{\sin(\alpha)}{1-\cos(\alpha)}=\dfrac{1+\cos(\alpha)}{\sin(\alpha)}",

    r"\sin(\alpha)": r"\dfrac{2t}{1+t^2}",
    r"\cos(\alpha)": r"\dfrac{1-t^2}{1+t^2}",
    r"\tan(\alpha)": r"\dfrac{2t}{1-t^2}",
    r"\cot(\alpha)": r"\dfrac{1-t^2}{2t}",

    r"\sin(\alpha)+\sin(\beta)": r"2\sin\left(\dfrac{\alpha+\beta}{2}\right)\cos\left(\dfrac{\alpha-\beta}{2}\right)",
    r"\sin(\alpha)-\sin(\beta)": r"2\sin\left(\dfrac{\alpha-\beta}{2}\right)\cos\left(\dfrac{\alpha+\beta}{2}\right)",
    r"\cos(\alpha)+\cos(\beta)": r"2\cos\left(\dfrac{\alpha+\beta}{2}\right)\cos\left(\dfrac{\alpha-\beta}{2}\right)",
    r"\cos(\alpha)-\cos(\beta)": r"-2\sin\left(\dfrac{\alpha+\beta}{2}\right)\sin\left(\dfrac{\alpha-\beta}{2}\right)",

    r"\sin(\alpha)\sin(\beta)": r"\dfrac{\cos(\alpha-\beta)-\cos(\alpha+\beta)}{2}",
    r"\cos(\alpha)\cos(\beta)": r"\dfrac{\cos(\alpha+\beta)+\cos(\alpha-\beta)}{2}",
    r"\sin(\alpha)\cos(\beta)": r"\dfrac{\sin(\alpha-\beta)+\sin(\alpha+\beta)}{2}",
    r"\sin(\beta)\cos(\alpha)": r"\dfrac{\sin(\alpha+\beta)-\sin(\alpha-\beta)}{2}",
}

# Generic function to execute the quiz
def quiz(dictionary):
    # Select a random pair from the dictionary
    key, result = random.choice(list(dictionary.items()))

    # Display the key (mathematical expression)
    display(Math(key))

    # Wait for user input to reveal the result
    input("Press enter to see the answer...")

    # Display the result (value)
    display(Math(result))

# Function to execute a random quiz with n questions
def random_quiz(n):
    for i in range(n):
        print(f"Question {i+1}:")

        # Randomly select the type of quiz
        quiz_type = random.choice(['limits', 'derivatives', 'integrals', 'associated_arcs', 'goniometric_formulas'])

        if quiz_type == 'limits':
            quiz(limits)
        elif quiz_type == 'derivatives':
            quiz(derivatives)
        elif quiz_type == 'integrals':
            quiz(integrals)
        elif quiz_type == 'associated_arcs':
            quiz(associated_arcs)
        elif quiz_type == 'goniometric_formulas':
            quiz(goniometric_formulas)

        print("\n")

# Run the quiz with n questions
random_quiz(10)
