import time
from typing import Callable, Dict
from lenovolight import LedController
import argparse


def effect1(controller: LedController) -> dict:
    """Whitey"""
    return controller.build_control_string(
        effect='static',
        colors=['ffffff'],
    )


def effect2(controller: LedController) -> dict:
    """Dark Red"""
    return controller.build_control_string(
        effect='static',
        colors=['570400'],
        brightness=2
    )

def effect3(controller: LedController) -> dict:
    """green-BLUE"""
    return controller.build_control_string(
        effect='static',
        colors=['47d642', '00426e'],
        brightness=2
    )

def effect4(controller: LedController) -> dict:
    """middle Purple"""
    return controller.build_control_string(
        effect='static',
        colors=['06000a', '8f00f5', '06000a'],
        brightness=2
    )

def effect5(controller: LedController) -> dict:
    """middle Purple"""
    return controller.build_control_string(
        effect='static',
        colors=['000000', '18c904', '000000'],
        brightness=2
    )

def effect12(controller: LedController) -> dict:
    """reddy"""
    # 'd91818',
    return controller.build_control_string(
        effect='static',
        colors=['0a0000', '570400', '000000', '851200'],
        brightness=2
    )

def effect6(controller: LedController) -> dict:
    """side blue"""
    return controller.build_control_string(
        effect='static',
        colors=['a60000', '080808', '002efa'],
        brightness=2
    )

def effect7(controller: LedController) -> dict:
    """Blue Red WAR"""
    return controller.build_control_string(
        effect='static',
        colors=['002efa', '080808', '960202'],
        brightness=1
    )

def effect8(controller: LedController) -> dict:
    """Goddy"""
    return controller.build_control_string(
        effect='static',
        colors=['d0e2f7', 'f2f2f2', '960202', 'f2f2f2'],
        brightness=2
    )

def effect9(controller: LedController) -> dict:
    """Rapid"""
    return controller.build_control_string(
        effect='wave',
        colors=None,
        brightness=1,
        wave_direction="rtl",
        speed=4
    )

def effect10(controller: LedController) -> dict:
    """Rapid"""
    return controller.build_control_string(
        effect='hue',
        colors=None,
        brightness=1,
        speed=4
    )

def effect11(controller: LedController) -> dict:
    """Chilly"""
    return controller.build_control_string(
        effect='hue',
        colors=None,
        brightness=1,
        speed=1
    )

def effect13(controller: LedController) -> dict:
    """low profile"""
    # 'd91818',
    return controller.build_control_string(
        effect='static',
        colors=['000000', '570400', '000000', '000000'],
        brightness=1
    )

def effect14(controller: LedController) -> dict:
    """NOO vibrant"""
    # 'd91818',
    return controller.build_control_string(
        effect='static',
        colors=['7734EA', '00A7EA', '8AE800', 'FFAA00'],
        # colors=['FF0061', '00A7EA', '8AE800', 'FFAA00'],
        brightness=2
    )

def effect15(controller: LedController) -> dict:
    """peach"""
    # 'd91818',
    return controller.build_control_string(
        effect='static',
        colors=['C52C14'],
        brightness=2
    )

def effect16(controller: LedController) -> dict:
    """neon green"""
    # 'd91818',
    return controller.build_control_string(
        effect='static',
        colors=['39FF14'],
        brightness=2
    )

def effect17(controller: LedController) -> dict:
    """neon 1"""
    # 'd91818',
    return controller.build_control_string(
        effect='static',
        # 'FF3131',
        # colors=['1F51FF', 'FF3131', '39FF14'],
        # colors=['1F51FF', '9D00FF', '39FF14'],
        colors=['1F51FF', 'FF3131', '9D00FF'],
        brightness=2
    )

def effect18(controller: LedController) -> dict:
    """neon 2"""
    # 'd91818',
    return controller.build_control_string(
        effect='static',
        # 'FF3131',
        # colors=['1F51FF', 'FF3131', '39FF14'],
        colors=['1F51FF', '9D00FF', '39FF14'],
        # colors=['1F51FF', 'FF3131', '9D00FF'],
        brightness=2
    )

def effect19(controller: LedController) -> dict:
    """neon 3"""
    # 'd91818',
    return controller.build_control_string(
        effect='static',
        # 'FF3131',
        colors=['1F51FF', 'FF3131', '39FF14'],
        # colors=['1F51FF', '9D00FF', '39FF14'],
        # colors=['1F51FF', 'FF3131', '9D00FF'],
        brightness=2
    )

def effect20(controller: LedController) -> dict:
    """neon purple """
    # 'd91818',
    return controller.build_control_string(
        effect='static',
        # 'FF3131',
        colors=['9D00FF'],
        # colors=['1F51FF', '9D00FF', '39FF14'],
        # colors=['1F51FF', 'FF3131', '9D00FF'],
        brightness=2
    )

def effect21(controller: LedController) -> dict:
    """low profile neon green"""
    # 'd91818',
    return controller.build_control_string(
        effect='static',
        colors=['000000', '39FF14', '000000', '000000'],
        # colors=['1F51FF', '9D00FF', ''],
        brightness=1
    )

def effect22(controller: LedController) -> dict:
    """glowing neon green"""
    # 'd91818',
    return controller.build_control_string(
        effect='breath',
        colors=['000000', '39FF14', '000000', '000000'],
        # colors=['1F51FF', '9D00FF', ''],
        brightness=1,
        speed=1
    )

def effect23(controller: LedController) -> dict:
    """glowing bloody red (heart xd)"""
    # 'd91818',
    return controller.build_control_string(
        effect='breath',
        colors=['000000', '880808', '000000', '000000'],
        # colors=['1F51FF', '9D00FF', ''],
        brightness=2,
        speed=1
    )

def effect24(controller: LedController) -> dict:
    """Cinema mid"""
    # 'd91818',
    return controller.build_control_string(
        effect='static',
        colors=['000000', 'd27575', '000000'],
        # colors=['1F51FF', '9D00FF', ''],
        brightness=1,
        speed=1
    )

def effect25(controller: LedController) -> dict:
    """ocean blue"""
    # 'd91818',
    return controller.build_control_string(
        effect='static',
        colors=['009dc4'],
        brightness=2
    )

def effect26(controller: LedController) -> dict:
    """ocean blue - white"""
    return controller.build_control_string(
        effect='static',
        colors=['009dc4', 'e2f9fe', '009dc4'],
        brightness=2
    )
    
def effect27(controller: LedController) -> dict:
    """sunset orange - purple"""
    return controller.build_control_string(
        effect='static',
        colors=['FA5F55', '581845', 'FA5F55'],
        brightness=2
    )



def cycle_all(effect_list, controller):
    while True:
        for name, func in effect_list.items():
            data = func(controller)
            controller.send_control_string(data)

            print(f"{func.__name__}: {name}")
            time.sleep(6)

effect_list = {
    'a': effect1,
    'b': effect2, 
    'r': effect3,
    'mp': effect4,
    'mg': effect5,
    'sb': effect6,
    'w': effect7,
    'g': effect8,
    'wr': effect9,
    'hr': effect10,
    'hs': effect11,
    'ry': effect12,
    'lp': effect13,
    'bck': effect15,
    'ng': effect16,
    'n1': effect17,
    'n2': effect18,
    'n3': effect19,
    'np': effect20,
    'lpng': effect21,
    'gng': effect22,
    'hrt': effect23,
    'cm': effect24,
    'ob': effect25,
    'obw': effect26,
    'sop': effect27,
    }

def main():
    # Parse arguments
    argparser = argparse.ArgumentParser(
            description="Keyboard Control Easy"
        )
    
    reserved_effects = effect_list.copy()
    effect_list["sample"] = lambda controller: cycle_all(reserved_effects, controller)

    argparser.add_argument('action', choices=effect_list.keys(), help=f'Specify action ({",".join(effect_list.keys())}).')

    args = argparser.parse_args()

    # Use controller
    controller = LedController()

    effect = effect_list.get(args.action)
    if effect:
        data = effect(controller)
    else:
        print("Not specified effect!")
        return
    
    controller.send_control_string(data)

if __name__ == "__main__":
    main()
