import pyautogui
#import selenium

pyautogui.PAUSE = 5

def configurar_firefox():
    #Email FireFox
    pyautogui.press("win")
    pyautogui.write("FireFox")
    pyautogui.press("enter")
    pyautogui.keyDown('ctrl')
    pyautogui.press("t")
    pyautogui.keyUp('ctrl')
    pyautogui.write("https://accounts.google.com/v3/signin/identifier?dsh=S118291408%3A1672781021235183&continue=https%3A%2F%2Fwww.google.com%2Fsearch%3Fclient%3Dfirefox-b-d%26q%3Dsign%2Bin&ec=GAZAAQ&hl=pt-BR&passive=true&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=AeAAQh6vuYkuIw9bcp8J_ZxRNin2f04dmFl2mhaBzP8ITxcPiNZPW1d8kW76WoURqnxOrjyjwf9V")
    pyautogui.press("enter")
    pyautogui.write("emanuelantunes1020@gmail.com")
    pyautogui.press("enter")
    pyautogui.write("chmod777")
    pyautogui.press("enter")
    pyautogui.press("esc")
    #Navegador FireFox
    pyautogui.keyDown('ctrl')
    pyautogui.press("t")
    pyautogui.keyUp('ctrl')
    pyautogui.write("https://accounts.firefox.com/?context=fx_desktop_v3&entrypoint=fxa_app_menu&action=email&service=sync")
    pyautogui.press("enter")
    pyautogui.write("emanuelantunes1020@gmail.com")
    pyautogui.press("enter")
    pyautogui.write("chmod777")
    pyautogui.press("enter")
    pyautogui.keyDown('ctrl')
    pyautogui.press("t")
    pyautogui.keyUp('ctrl')
    #...


def configurar_google():
    #Email Google
    pyautogui.press("win")
    pyautogui.write("Google")
    pyautogui.press("enter")
    pyautogui.keyDown('ctrl')
    pyautogui.press("t")
    pyautogui.keyUp('ctrl')
    pyautogui.write("https://accounts.google.com/v3/signin/identifier?dsh=S118291408%3A1672781021235183&continue=https%3A%2F%2Fwww.google.com%2Fsearch%3Fclient%3Dfirefox-b-d%26q%3Dsign%2Bin&ec=GAZAAQ&hl=pt-BR&passive=true&flowName=GlifWebSignIn&flowEntry=ServiceLogin&ifkv=AeAAQh6vuYkuIw9bcp8J_ZxRNin2f04dmFl2mhaBzP8ITxcPiNZPW1d8kW76WoURqnxOrjyjwf9V")
    pyautogui.press("enter")
    pyautogui.write("emanuelantunes1020@gmail.com")
    pyautogui.press("enter")
    pyautogui.write("chmod777")
    pyautogui.press("enter")
    pyautogui.press("esc")


configurar_firefox()
configurar_google()
