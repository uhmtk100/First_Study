# ch 4.2.1 mian.py


import sys

from PyQt6.QtWidgets import QApplication, QWidget


def main():
    w = QWidget()

    w.resize(320, 240)
    w.setWindowTitle('Calculator')
    w.resize(1024,1024)
    w.show()

    sys.exit(app.exec())


if __name__ == '__main__':
    app = QApplication(sys.argv)
    main()
