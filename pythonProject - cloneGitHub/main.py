from PyQt5 import QtWidgets, uic, QtGui
from PyQt5.QtWidgets import QApplication,  QWidget, QTableWidget, QTableWidgetItem, QVBoxLayout
import sys
import pyodbc

class mainWindow(QtWidgets.QMainWindow):
    def __init__(self):
        # Main UI
        super(mainWindow, self).__init__()
        uic.loadUi('mainAdmin.ui', self)
        # Show program
        self.show()

        # Chức năng danh sách môn học
        self.button1 = self.findChild(QtWidgets.QPushButton, 'pushButton_1')
        self.button1.clicked.connect(self.uiDanhSachMonHoc)

        # Chức năng danh sách sinh viên
        self.button3 = self.findChild(QtWidgets.QPushButton, 'pushButton_2')
        self.button3.clicked.connect(self.uiDanhSachSinhVien)
    def uiDanhSachMonHoc(self):
        # Main UI
        super(mainWindow, self).__init__()
        uic.loadUi('uiDanhSachMonHoc.ui', self)
        self.danhSachMonHoc()
        # Show program
        self.show()
    def danhSachMonHoc(self):
        # Connect to db
        connectDB = self.connectDB()
        cursor = connectDB.cursor()
        query = "SELECT maMH,tenMH,tenGiaoVien,caHoc,soTinChi,ngayBatDau FROM dbo.monHoc"
        result = cursor.execute(query)

        self.tableWidget.setRowCount(0)
        for row_number, row_data in enumerate(result):
            self.tableWidget.insertRow(row_number)
            for column_number, data in enumerate(row_data):
                self.tableWidget.setItem(row_number, column_number, QtWidgets.QTableWidgetItem(str(data)))
    def uiDanhSachSinhVien(self):
        # Main UI
        super(mainWindow, self).__init__()
        uic.loadUi('uiDanhSachSinhVien.ui', self)
        self.danhSachSinhVien()
        # Show program
        self.show()
        self.button3 = self.findChild(QtWidgets.QPushButton, 'pushButton_3')
        self.button3.clicked.connect(self.danhSachSinhVien)
    def danhSachSinhVien(self):
        # Connect to db
        connectDB = self.connectDB()
        cursor = connectDB.cursor()
        query = "SELECT * FROM sinhVien"
        result = cursor.execute(query)

        self.tableWidget.setRowCount(0)
        for row_number, row_data in enumerate(result):
            self.tableWidget.insertRow(row_number)
            for column_number, data in enumerate(row_data):
                self.tableWidget.setItem(row_number, column_number, QtWidgets.QTableWidgetItem(str(data)))
    def connectDB(self):
        connectDB = pyodbc.connect('Driver={SQL Server};'
                                   'Server=DESKTOP-TJ10SPJ;'
                                   'Database=mainDatabase;'
                                   'Trusted_Connection=yes;')
        return connectDB
app = QtWidgets.QApplication(sys.argv)
window = mainWindow()
app.exec_()
